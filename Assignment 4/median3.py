# Find the median of 3 numbers read from user input

def read_nums():
  nums = []
  i = 0
  while (i < 3):
    try:
      number = input('Enter a number: ')
      nums.append(number)
      i += 1
    except:
      print "Invalid number"
  return nums


def find_median(nums):
  a = nums[0]
  b = nums[1]
  c = nums[2]

  if a > b:
    if c > a:
      return a
    elif b > c:
      return b
    else:
      return c
  else:
    if c > b:
      return b
    elif a > c:
      return a
    else:
      return c

user_input = read_nums()
print find_median(user_input)
