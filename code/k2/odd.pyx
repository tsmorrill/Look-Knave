def print_odd(int iter):
  '''Calculate expansion of S_odd, using substitution system by Mansur Boase'''

  cdef str S = '1011'
  cdef int start
  cdef int end = 0
  cdef int current_bit = 1

  cdef list one_sub = ['0011', '0101', '011', '0111',
                       '0111011']
  cdef list zero_sub = ['11', '101110', '100']

  cdef int rlen
  cdef int i

  for i in range(iter):
    start = end + 1
    end = start
    current_bit = 1 - current_bit
    while end < len(S) - 1:
      if int(S[end + 1]) == current_bit:
        end += 1
      else:
        break
    rlen = end - start + 1
    if current_bit == 1:
      print(S[start:end+1])
      print(one_sub[rlen - 1])
      print(S)
      S = ''.join([S, one_sub[rlen - 1]])
      print(S)
    else:
      print(S[start:end+1])
      print(zero_sub[rlen - 1])
      print(S)
      S = ''.join([S, zero_sub[rlen - 1]])
      print(S)

  return(S)
