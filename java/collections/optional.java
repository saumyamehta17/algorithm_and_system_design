# Optional is a generic collection single-value container which can be empty or present
# following code
String version = computer.getSoundCard().getUSB().getVersion();

# lets say there is absence of sound card and it will return Null pointer exception
# one solution is add lot of if else condition, like follow:
String version = "UNKNOWN"
if(computer.getSoundCard() != null){
  if(computer.getSoundCard().getUSB() != null){
    version = computer.getSoundCard().getUSB().getVersion();
  }
}

# above code is ugly and we may miss some conditions
# Optional
public class Computer{
  private Optional<SoundCard> soundCard;
}
public class soundCard{
  private Optional<USB> USB;
}
public class USB{
  public string getVersion(){..}
}

SoundCard soundCard = new soundCard();
Optional<SoundCard> sc = Optional.of(soundCard);
sc.ifPresent(sc.get());