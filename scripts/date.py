#!/usr/bin/env python

from datetime import date
    
digits = ['一', '二', '三', '四', '五', '六', '七', '八', '九']

def get_number(num, special_char, divisor):
    """Returns the number in the year"""
    if num == 0:
        return ''
    # ones place
    elif divisor == 1:
        return str(digits[num - 1]) 

    j_str = ''
    first = num // divisor
    # > 1 because they don't say ichi sen, just sen for 1000
    if first > 1:
        j_str += str(digits[first - 1]) 
        return j_str + special_char
    return '' 


def parse_year(year):
    """
    Parse the year into its separate parts and return an array of the parts
    """
    multipliers = [1000, 100, 10, 1]
    places = []
    count = 0
    # assumes that we won't ever make it to year 10,000
    for number in str(year):
       places.append(int(number) * multipliers[count]) 
       count += 1

    j_thousands = get_number(places[0], '千', 1000)
    j_hundreds = get_number(places[1], '百', 100)
    j_tens = get_number(places[2], '十', 10)
    j_ones = get_number(places[3], '', 1)
    j_year = j_thousands + j_hundreds + j_tens + j_ones + '年'
    return j_year


# array of months and days of the months, up to 31
month_arr = ['一月', '二月', '三月', '四月', '五月', '六月', '七月',
             '八月', '九月', '十月', '十一月', '十二月']
day_arr = ['一日', 'ニ日', '三日', '四日', '五日', '六日', '七日', '八日',
           '九日', '十日', '十一日', '十二日', '十三日', '十四日', '十五日',
           '十六日', '十七日', '十八日', '十九日', '二十日', '二十一日',
           '二十二日', '二十三日', '二十四日', '二十五日', '二十六日',
           '二十七日', '二十八日', '二十九日', '三十日', '三十一日']

# get the current date
today = date.today()

# get refs to the year, month, and day (number)
year = today.year
month = today.month
day = today.day

# month-1 for the 0-indexed arrs
j_month = month_arr[month - 1]
j_day = day_arr[day - 1]
j_year = parse_year(year)
print(j_month+j_day+j_year)
