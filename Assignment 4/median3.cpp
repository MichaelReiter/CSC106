#include <iostream>
#include <vector>

using namespace std;

vector<int> read_nums() {
  vector<int> nums(3);

  int i = 0;
  while (i < 3) {
    int num;
    cout << "Enter a number: ";
    cin >> num;
    nums[i] = num;
    i++;
  }

  return nums;
}


int find_median(vector<int> nums) {
  int a = nums[0];
  int b = nums[1];
  int c = nums[2];

  if (a > b) {
    if (c > a) {
      return a;
    } else if (b > c) {
      return b;
    } else {
      return c;
    }
  } else {
    if (c > b) {
      return b;
    } else if (a > c) {
      return a;
    } else {
      return c;
    }
  }
}


int main() {
  vector<int> userInput = read_nums();
  cout << find_median(userInput) << endl;
  return 0;
}