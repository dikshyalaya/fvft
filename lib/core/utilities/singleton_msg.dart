/// Class [Singleton] : Used to mark a class as singleton. Used for readability.
class Singleton {
  /// Message provided to the user
  final String message;

  const Singleton(this.message);

  @override
  String toString() => 'Singleton class: $message';
}

const Singleton singleton = Singleton('This class will have only one instance');

const Singleton caching = Singleton('Using this class/method, data are cached');
