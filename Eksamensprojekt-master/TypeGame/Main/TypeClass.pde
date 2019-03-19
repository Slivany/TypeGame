class TypeClass {
  int lvl = 0;
  int reset = 0;

  //Vi går her én level op ved at plusse level med et
  void nextLvl()
  {
    lvl = lvl + 1;
  }

  void lvlUP() {
    if (corrects >= corTilLevel) {
      type.nextLvl();
      corrects = reset;
      chosen = "";
      leveling = true;
    }
  }
}