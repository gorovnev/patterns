namespace Singleton;

class SimpleSingleton
{
    private static SimpleSingleton? _instance;
    public static int InstanceCount;

    protected SimpleSingleton()
    {
    }

    public static SimpleSingleton Instance
    {
        get
        {
            if (_instance == null)
            {
                Interlocked.Increment(ref InstanceCount);
                _instance = new SimpleSingleton();
            }

            return _instance;
        }
    }

    public int Value { get; set; } = default!;
}

class SingletonWithLocker
{
    private static SingletonWithLocker? _instance;
    public static int InstanceCount;
    private static readonly object Locker = new ();

    protected SingletonWithLocker()
    {
    }

    public static SingletonWithLocker Instance
    {
        get
        {
            lock (Locker)
            {
                if (_instance == null)
                {
                    Interlocked.Increment(ref InstanceCount);
                    _instance = new SingletonWithLocker();
                }

                return _instance;
            }
        }
    }

    public int Value { get; set; } = default!;
}

class FeatureProvedSingleton
{
    private static FeatureProvedSingleton? _instance;
    public static int InstanceCount;
    private static readonly object Locker = new ();

    protected FeatureProvedSingleton()
    {
    }

    public static FeatureProvedSingleton Instance
    {
        get
        {
            if (_instance != null)
                return _instance;
            lock (Locker)
            {
                if (_instance == null)
                {
                    Interlocked.Increment(ref InstanceCount);
                    _instance = new FeatureProvedSingleton();
                }
                
                return _instance;
            }
        }
    }

    public int Value { get; set; } = default!;
}