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
    for (int i=0; i<num/2; i++) {
      ll.add(new Light(x+i*5, y, i));
    }
    for (int i=0; i<num/2; i++) {
      ll.add(new Light(x+num/2*5-(i+1)*5, y+8, num-1-i));
    }
  }
  void lit(int i, int lit, byte c1, byte c2, byte c3) {
    while (lit<0)lit+=num/2;
    while (lit>num/2-1)lit-=num/2;//??????????
    if (i==(lit)) {
      Light temp = ll.get(i);
      temp.sendColor(c1, c2, c3);
      buf[(3*i+7+0)] =temp.c1; 
      buf[(3*i+7+1)] =temp.c2; 
      buf[(3*i+7+2)] =temp.c3; 
      fill(temp.c1*2, 255, 255);
    }
    if (i==(num-1-lit)) {  
      Light temp = ll.get(i);
      temp.sendColor(c1, c2, c3);
      buf[(3*(num-1-lit)+7+0)] =temp.c1; 
      buf[(3*(num-1-lit)+7+1)] =temp.c2; 
      buf[(3*(num-1-lit)+7+2)] =temp.c3; 
      fill(temp.c1*2, 255,255);
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
        lit(i, lit+j, temp.c1, temp.c2, temp.c3);
      }
      // print('#'+hex(ll.get(i). c,2)+hex(ll.get(i).c,2)+hex(ll.get(i).c,2) );
      ll.get(i).update(c);
      fill(0);
    }
    //for (int i=0; i<num*3+7; i++) {
    myPort.write(buf); 
    //  //  println((ll.get(0).c));[buf[0],buf[1],buf[2],buf[3],buf[4]]
    // }
  }
}