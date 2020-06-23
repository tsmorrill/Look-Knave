# distutils: language = c++

from libcpp.string cimport string

cpdef str k_map(int iter=1, str string='1', bint print_all=True):
    """Calculate iter terms in the binay Look-Knave sequence starting at string.
    """
    cdef str buffer, r_string, cur_string
    cdef int truedigit, index, start, end, r_len, b_len, i, cur_bit
    cdef double percent

    cdef bint second_pass = False
    cur_bit = 1 - int(string[0])
    if cur_bit == 0:
        cur_string = '0'
    else:
        cur_string = '1'

    for i in range(iter):
        if second_pass:
            cur_bit = 0
        else:
            second_pass = True
        if print_all:
            print(string)

        buffer = string
        b_len = len(buffer)

        end = -1
        string = ''

        while end < b_len - 1:             # describe buffer
            cur_bit = 1 - cur_bit
            if cur_bit == 0:               # avoid type conversions
                cur_string = '0'
            else:
                cur_string = '1'
            start = end + 1                # move window
            end = start
            if end < b_len - 1:
                while buffer[end + 1] == cur_string:
                    end += 1
                    if end == len(buffer) - 1:
                        break
            r_len = end - start + 1

            if r_len == 1:
                r_string = '1'
            elif r_len == 2:
                r_string = '10'
            elif r_len == 3:
                r_string = '11'
            elif r_len == 4:
                r_string = '100'
            elif r_len == 5:
                r_string = '101'
            else:
                r_string = string(bin(r_len)[2:])

            if cur_bit == 0:
                string = ''.join([string, r_string, '1'])
            else:
                string = ''.join([string, r_string, '0'])
    return(string)
