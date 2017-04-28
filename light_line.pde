class LightLine {
  ArrayList<Light>ll = new ArrayList<Light>();
  int x, y;
  int num;
  byte c;
  LightLine(int _x, int _y, int _num) {
    c =0;
    num =_num;
    x=_x;
    y=_y;
    for (int i=0; i<num; i++) {
      ll.add(new Light(x+i*5, y, i));
    }
  }
  void update(int lit, int len) {   
    for (int i=0; i<num; i++) {
      ////clear the buffer
      buf[(3*i+7+0)] =0x00;
      buf[(3*i+7+1)] =0x00;
      buf[(3*i+7+2)] =0x00;
      for (int j=0; j<len; j++) {
        Light temp = ll.get(i);
        //while (lit+j<0)lit+=num/2;
        //while (lit+j>num/2-1)lit-=num/2;//??????????
        if (i==(lit+j)) {
          temp.sendColor(temp.c1, temp.c2, temp.c3);
          buf[(3*i+7+0)] =temp.c1; 
          buf[(3*i+7+1)] =temp.c2; 
          buf[(3*i+7+2)] =temp.c3; 
          fill(temp.c1*2, temp.c2*2, temp.c3*2);
        }
      }
      ll.get(i).update();
      fill(0);
    }
    println(buf.length);
    // myPort.write(buf); 
  }
}