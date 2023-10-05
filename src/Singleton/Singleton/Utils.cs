using System.Diagnostics;

namespace Singleton;

public class ActionResult
{
    public int Number { get; set; }
    public int Result { get; set; }
    public TimeSpan Elapsed { get; set; }
}

public class Utils
{
    public static Dictionary<int, ActionResult> Action(IList<int> numbers, Func<int, int> action)
    {
        Dictionary<int, ActionResult> result = new (numbers.Count);
        Parallel.ForEach(numbers, number =>
        {
            var watch = new Stopwatch();
            watch.Start();
            var res = action(number);
            watch.Stop();
            result.Add(number, new ActionResult {Number = number, Result = res, Elapsed = watch.Elapsed});
        });

        return result;
    }

    public static void PrintStat(Dictionary<int, ActionResult> stat)
    {
        var avg = stat.Select(p => p.Value.Elapsed.TotalMilliseconds).Average();
        Console.WriteLine($"Average duration, milliseconds:{avg}");
    }
}