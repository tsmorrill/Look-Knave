# distutils: language = c++
from libcpp.string cimport string

cpdef str k_map(int iter=1, str string='1', bint print_all=True):
    """Calculate iter terms in the binay Look-Knave sequence starting at string.
    """
    cdef str r_string, cur_string
    cdef int truedigit, index, start, end, r_len, s_len, i, cur_bit
    cdef double percent
    cdef list word_list

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

        s_len = len(string)
        word_list = []
        end = -1

        while end < s_len - 1:             # describe string

            cur_bit = 1 - cur_bit
            if cur_bit == 0:               # avoid type conversions
                cur_string = '0'
            else:
                cur_string = '1'
            start = end + 1                # move window
            end = start
            if end < s_len - 1:
                while string[end + 1] == cur_string:
                    end += 1
                    if end == s_len - 1:
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
                r_string = str(bin(r_len)[2:])

            if cur_bit == 0:
                word_list.extend([r_string, '1'])
            else:
                word_list.extend([r_string, '0'])
        string = ''.join(word_list)
    return(string)
