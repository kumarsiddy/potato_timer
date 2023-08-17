enum StringKey {
  invalidTitle('Please enter a valid title'),
  title('Title'),
  sampleTitle('Enter your task title'),
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
