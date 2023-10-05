using System.Diagnostics;
using Singleton;

var limit = 1_000_000;
var numbers = Enumerable.Range(0, limit).ToList();

var tests = new[]
{
    new Action<List<int>>(nums =>
    {
        var watch = Stopwatch.StartNew();
        var stat = Utils.Action(nums, val =>
        {
            SimpleSingleton.Instance.Value = val;
            return SimpleSingleton.InstanceCount;
        });
        watch.Stop();

        Console.WriteLine($"Test duration:{watch.Elapsed}");
        Console.WriteLine($"Instance count:{SimpleSingleton.InstanceCount}");
        Utils.PrintStat(stat);
    }),
    new Action<List<int>>(nums =>
    {
        var watch = Stopwatch.StartNew();
        var stat = Utils.Action(nums, val =>
        {
            SingletonWithLocker.Instance.Value = val;
            return SingletonWithLocker.InstanceCount;
        });
        watch.Stop();

        Console.WriteLine($"Test duration:{watch.Elapsed}");
        Console.WriteLine($"Instance count:{SingletonWithLocker.InstanceCount}");
        Utils.PrintStat(stat);
    }),
    new Action<List<int>>(nums =>
    {
        var watch = Stopwatch.StartNew();
        var stat = Utils.Action(nums, val =>
        {
            FeatureProvedSingleton.Instance.Value = val;
            return FeatureProvedSingleton.InstanceCount;
        });
        watch.Stop();

        Console.WriteLine($"Test duration:{watch.Elapsed}");
        Console.WriteLine($"Instance count:{FeatureProvedSingleton.InstanceCount}");
        Utils.PrintStat(stat);
    }),
};

foreach (var test in tests)
{
    test(numbers);
}
