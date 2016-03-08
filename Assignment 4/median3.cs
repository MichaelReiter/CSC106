using System;

public class Median3
{
	public static int[] ReadNums()
	{
		int[] nums = new int[3];
		int i = 0;
		while (i < 3)
		{
			Console.Write("Enter a number: ");
			string number = Console.ReadLine();
			int num;
			if (Int32.TryParse(number, out num))
			{
				nums[i] = num;
				i++;
			}
			else
			{
				Console.WriteLine("Invalid number");
			}
		}

		return nums;
	}

	public static int FindMedian(int[] nums)
	{
		int a = nums[0];
		int b = nums[1];
		int c = nums[2];

		if (a > b)
		{
			if (c > a)
			{
				return a;
			}
			else if (b > c)
			{
				return b;
			}
			else
			{
				return c;
			}
		}
		else
		{
			if (c > b)
			{
				return b;
			}
			else if (a > c)
			{
				return a;
			}
			else
			{
				return c;
			}
		}
	}

	public static void Main()
	{
		int[] userInput = ReadNums();
		Console.WriteLine(FindMedian(userInput));
	}
}