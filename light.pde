class Light {
  byte c;
  int x, y;
  int index;
  Light(int _x, int _y, int _index) {
    c =0;
    index = _index;

    x=_x;
    y=_y;
  }
  void sendColor(byte _c) {
    c = _c;
  }

  void update(byte _c) {
    c= _c;
    ellipse(x, y, 5, 5);
   
   // print(c);
  }
}