enum StringKey {
  hour('Hour'),
  minute('Minute'),
  second('Second'),
  hh('HH'),
  mm('MM'),
  ss('SS'),
  durationHint('00'),
  duration('Duration'),
  invalidDescription('Please enter a valid description'),
  invalidTitle('Please enter a valid title'),
  title('Title'),
  sampleTitle('Example: Turn off Stove, Call Ma'),
  sampleDescription('Example: Missed call from Ma give a call'),
  description('Description'),
  addTask('Add Task'),
  empty(''),
  potatoTimer('Potato Timer'),
  pressBackToExit('Please Press Back Again to exit'),
  pleaseTryAgain('Some error occurred, Please try again!'),
  someErrorOccurred('Some error occurred, Please try again!'),
  makeSureInternetIsOn('Make sure internet is connected');

  final String value;

  const StringKey(this.value);
}
