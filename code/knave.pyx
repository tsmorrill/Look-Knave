# distutils: language = c++

from libcpp.string cimport string

cpdef str k_map(int iter=1, str string='1', bint print_all=True):
    """Calculate iter terms in the binay Look-Knave sequence starting at string.
    """
    cdef str buffer, outstring, glyph
    cdef int truedigit, index, start, end, rlen, blen, i
    cdef double percent

    for i in range(iter):
        if print_all:
            print(string)
        else:
            percent = i/iter
            print(percent)

        buffer = string
        blen = len(buffer)

        end = -1
        string = ''

        while end < blen - 1:              # describe buffer
            start = end + 1                       # move window
            end = start
            glyph = buffer[start]
            if glyph == '0':
                lieglyph = '1'
            else:
                lieglyph = '0'
            if end < blen - 2:
                while buffer[end + 1] == glyph:
                    end += 1
                    if end == len(buffer) - 1:
                        break
            rlen = end - start + 1
            string = ''.join([string, str(bin(rlen)[2:]), lieglyph])
    return(string)
