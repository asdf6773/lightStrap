class Light {
  byte c1, c2, c3;
  int x, y;
  int index;
  Light(int _x, int _y, int _index) {
    index= _index;
    if (index<=num/2-1) {
      c1=byte(map(index, 0, num/2-1, 0, 127));
    } else {
      c1=byte(map(index, num/2-1, num, 0, 127));
    }
    c2=byte(random(127));
    c3=byte(random(127));
    index = _index;
    x=_x;
    y=_y;
  }
  void sendColor(byte _c1, byte _c2, byte _c3) {
    c1 = _c1;
    c2 = _c2;
    c3 = _c3;
  }

  void update(byte _c) {
    //c= _c1;
    ellipse(x, y, 5, 5);

    // print(c);
  }
}