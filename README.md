[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/K8OywbE8)
# CSE220_HW7

## MIPS Programming  

SBU ID#:	115157187

Name:		Luciano Adam


## Test cases for each part:

### Part 1:

#### 1
```
Triangle(0) or Square(1) or Pyramid (2)? 0

Required size? 3

*
**
***
-- program is finished running --
```

#### 2
```
Triangle(0) or Square(1) or Pyramid (2)? 1

Required size? 3

***
***
***

-- program is finished running --
```

#### 3
```
Triangle(0) or Square(1) or Pyramid (2)? 2

Required size? 3

  * 
 * * 
* * * 


-- program is finished running --
```

#### 4
```
Triangle(0) or Square(1) or Pyramid (2)? 3

Shape choice must be in range 0 <= x <= 2
-- program is finished running --
```

#### 5
```
Triangle(0) or Square(1) or Pyramid (2)? 0

Required size? 1

*

-- program is finished running --
```

#### 6
```
Triangle(0) or Square(1) or Pyramid (2)? 2

Required size? 1

* 

-- program is finished running --
```

#### 7
```
Triangle(0) or Square(1) or Pyramid (2)? 0

Required size? -1

Size must be in range 0 < x
-- program is finished running --
```

#### 8
```
Triangle(0) or Square(1) or Pyramid (2)? 2

Required size? 7

      * 
     * * 
    * * * 
   * * * * 
  * * * * * 
 * * * * * * 
* * * * * * * 

-- program is finished running --
```

#### 9
```
Triangle(0) or Square(1) or Pyramid (2)? 2

Required size? 0

Size must be in range 0 < x
-- program is finished running --
```

#### 10
```
Triangle(0) or Square(1) or Pyramid (2)? 0

Required size? 5

*
**
***
****
*****

-- program is finished running --
```

### Part 2:

*Different values of **m** at the start of every code snippet **(not actually in output)***

#### 1
```
{ m = 10 }

A[1]=1
B[1]=2
A[2]=3
B[2]=4
A[3]=5
B[3]=6
A[4]=7
B[4]=8
A[5]=9
B[5]=10
A[6]=11
B[6]=12
A[7]=13
B[7]=14
A[8]=15
B[8]=16
A[9]=17
B[9]=18
A[10]=19
B[10]=20

2 1|4 3|6 5|8 7|10 9|12 11|14 13|16 15|18 17|20 19|
-- program is finished running --
```

#### 2
```
{ m = 10 }

A[1]=1
B[1]=2
A[2]=1
B[2]=2
A[3]=1
B[3]=2
A[4]=1
B[4]=2
A[5]=1
B[5]=2
A[6]=1
B[6]=2
A[7]=1
B[7]=2
A[8]=1
B[8]=2
A[9]=1
B[9]=2
A[10]=1
B[10]=2

2 1|2 1|2 1|2 1|2 1|2 1|2 1|2 1|2 1|2 1|
-- program is finished running --
```

#### 3
```
{ m = 101 }

Not enough memory allocated
-- program is finished running --
```

#### 4
```
{ m = 5 }

A[1]=1
B[1]=2
A[2]=3
B[2]=4
A[3]=5
B[3]=5
A[4]=4
B[4]=3
A[5]=2
B[5]=1

2 1|4 3|5 5|3 4|1 2|
-- program is finished running --
```

#### 5
```
{ m = 1 }

A[1]=6
B[1]=9

9 6|
-- program is finished running --
```

#### 6
```
{ m = 0 }

m must be greater than 0
-- program is finished running --
```

#### 7
```
{ m = -1 }

m must be greater than 0
-- program is finished running --
```

#### 8
```
{ m = 10 }

A[1]=12321
B[1]=54134
A[2]=57457
B[2]=8690
A[3]=425234
B[3]=76657
A[4]=4243
B[4]=65768
A[5]=42442
B[5]=54666
A[6]=32434
B[6]=658576
A[7]=3242
B[7]=43657
A[8]=3452
B[8]=96785
A[9]=2345
B[9]=12356
A[10]=9876
B[10]=2346

54134 12321|8690 57457|76657 425234|65768 4243|54666 42442|658576 32434|43657 3242|96785 3452|12356 2345|2346 9876|
-- program is finished running --
```

#### 9
```
{ m = 10 }

A[1]=10
B[1]=9
A[2]=8
B[2]=7
A[3]=6
B[3]=5
A[4]=4
B[4]=3
A[5]=2
B[5]=1
A[6]=1
B[6]=2
A[7]=3
B[7]=4
A[8]=5
B[8]=6
A[9]=7
B[9]=8
A[10]=9
B[10]=0

9 10|7 8|5 6|3 4|1 2|2 1|4 3|6 5|8 7|0 9|
-- program is finished running --
```

#### 10
```
{ m = 8 }

A[1]=5634
B[1]=1234
A[2]=46564
B[2]=12324
A[3]=65765
B[3]=2342
A[4]=5467
B[4]=1234
A[5]=76875
B[5]=123543
A[6]=64656
B[6]=23426
A[7]=9876
B[7]=2341
A[8]=356
B[8]=2345

1234 5634|12324 46564|2342 65765|1234 5467|123543 76875|23426 64656|2341 9876|2345 356|
-- program is finished running --
```

### Part 3:

*Different values of **m, row_m, col_m, row_v, col_v** at the start of every code snippet **(not actually in output)***

#### 1
```
{ m = 10, row_m = 5, col_m = 5, row_v = 5, col_v = 1 }

Matrix:
Enter element 1 = 2
Enter element 2 = 2
Enter element 3 = 2
Enter element 4 = 2
Enter element 5 = 2
Enter element 6 = 2
Enter element 7 = 2
Enter element 8 = 2
Enter element 9 = 2
Enter element 10 = 2
Enter element 11 = 2
Enter element 12 = 2
Enter element 13 = 2
Enter element 14 = 2
Enter element 15 = 2
Enter element 16 = 2
Enter element 17 = 2
Enter element 18 = 2
Enter element 19 = 2
Enter element 20 = 2
Enter element 21 = 2
Enter element 22 = 2
Enter element 23 = 2
Enter element 24 = 2
Enter element 25 = 2

Vector:
Enter element 1 = 2
Enter element 2 = 2
Enter element 3 = 2
Enter element 4 = 2
Enter element 5 = 2


Result: 
<20, 20, 20, 20, 20>
-- program is finished running --
```

#### 2
```
{ m = 10, row_m = 5, col_m = 5, row_v = 5, col_v = 1 }

Matrix:
Enter element 1 = 1
Enter element 2 = 2
Enter element 3 = 3
Enter element 4 = 4
Enter element 5 = 5
Enter element 6 = 6
Enter element 7 = 7
Enter element 8 = 8
Enter element 9 = 9
Enter element 10 = 10
Enter element 11 = 11
Enter element 12 = 12
Enter element 13 = 13
Enter element 14 = 14
Enter element 15 = 15
Enter element 16 = 16
Enter element 17 = 17
Enter element 18 = 18
Enter element 19 = 19
Enter element 20 = 20
Enter element 21 = 21
Enter element 22 = 22
Enter element 23 = 23
Enter element 24 = 24
Enter element 25 = 25

Vector:
Enter element 1 = 26
Enter element 2 = 27
Enter element 3 = 28
Enter element 4 = 29
Enter element 5 = 30


Result: 
<430, 1130, 1830, 2530, 3230>
-- program is finished running --
```

#### 3
```
{ m = 10, row_m = 3, col_m = 4, row_v = 3, col_v = 1 }

NOT WORKABLE BECAUSE OF THE DIMENSIONS
-- program is finished running --
```

#### 4
```
{ m = 4, row_m = 5, col_m = 5, row_v = 5, col_v = 1 }

DIMENSION EXCEEDS M
-- program is finished running --
```

#### 5
```
{ m = 11, row_m = 11, col_m = 10, row_v = 10, col_v = 1 }

NOT WORKABLE BECAUSE OF THE MEMORY
-- program is finished running --
```

#### 6
```
{ m = 10, row_m = 5, col_m = 5, row_v = 5, col_v = 2 }

NO VECTOR INPUTTED
-- program is finished running --
```

#### 7
```
{ m = 0, row_m = 5, col_m = 5, row_v = 5, col_v = 1 }

M IS INVALID
-- program is finished running --
```

#### 8
```
{ m = 10, row_m = 5, col_m = -5, row_v = 5, col_v = 1 }

NOT WORKABLE BECAUSE OF THE DIMENSIONS
-- program is finished running --
```

#### 9
```
{ m = 10, row_m = 5, col_m = 0, row_v = 5, col_v = 1 }

NOT WORKABLE BECAUSE OF THE DIMENSIONS
-- program is finished running --
```

#### 10
```
{ m = 15, row_m = 15, col_m = 5, row_v = 5, col_v = 1 }

Matrix:
Enter element 1 = 1
Enter element 2 = 2
Enter element 3 = 3
Enter element 4 = 4
Enter element 5 = 5
Enter element 6 = 6
Enter element 7 = 7
Enter element 8 = 8
Enter element 9 = 9
Enter element 10 = 10
Enter element 11 = 11
Enter element 12 = 12
Enter element 13 = 13
Enter element 14 = 14
Enter element 15 = 15
Enter element 16 = 16
Enter element 17 = 17
Enter element 18 = 18
Enter element 19 = 19
Enter element 20 = 20
Enter element 21 = 21
Enter element 22 = 22
Enter element 23 = 23
Enter element 24 = 24
Enter element 25 = 25
Enter element 26 = 26
Enter element 27 = 26
Enter element 28 = 28
Enter element 29 = 29
Enter element 30 = 30
Enter element 31 = 31
Enter element 32 = 32
Enter element 33 = 33
Enter element 34 = 34
Enter element 35 = 35
Enter element 36 = 36
Enter element 37 = 37
Enter element 38 = 38
Enter element 39 = 39
Enter element 40 = 40
Enter element 41 = 41
Enter element 42 = 42
Enter element 43 = 43
Enter element 44 = 44
Enter element 45 = 45
Enter element 46 = 46
Enter element 47 = 47
Enter element 48 = 484
Enter element 49 = 49
Enter element 50 = 50
Enter element 51 = 51
Enter element 52 = 52
Enter element 53 = 53
Enter element 54 = 54
Enter element 55 = 55
Enter element 56 = 56
Enter element 57 = 57
Enter element 58 = 58
Enter element 59 = 59
Enter element 60 = 60
Enter element 61 = 61
Enter element 62 = 62
Enter element 63 = 63
Enter element 64 = 64
Enter element 65 = 65
Enter element 66 = 66
Enter element 67 = 67
Enter element 68 = 68
Enter element 69 = 69
Enter element 70 = 70
Enter element 71 = 71
Enter element 72 = 72
Enter element 73 = 73
Enter element 74 = 75
Enter element 75 = 74

Vector:
Enter element 1 = 1
Enter element 2 = 2
Enter element 3 = 3
Enter element 4 = 4
Enter element 5 = 5
Enter element 6 = 6
Enter element 7 = 7
Enter element 8 = 8
Enter element 9 = 9
Enter element 10 = 10
Enter element 11 = 11
Enter element 12 = 12
Enter element 13 = 13
Enter element 14 = 14
Enter element 15 = 15


Result: 
<1240, 3028, 4840, 7948, 8439>
-- program is finished running --
```

#### 11
```
{ m = 10, row_m = 6, col_m = 3, row_v = 3, col_v = 1 }

Matrix:
Enter element 1 = 1
Enter element 2 = 2
Enter element 3 = 3
Enter element 4 = 4
Enter element 5 = 5
Enter element 6 = 6
Enter element 7 = 7
Enter element 8 = 8
Enter element 9 = 9
Enter element 10 = 10
Enter element 11 = 11
Enter element 12 = 12
Enter element 13 = 13
Enter element 14 = 14
Enter element 15 = 15
Enter element 16 = 16
Enter element 17 = 17
Enter element 18 = 18

Vector:
Enter element 1 = 1
Enter element 2 = 2
Enter element 3 = 3


Result: 
<14, 32, 50, 68, 86, 104>
-- program is finished running --
```