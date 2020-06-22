def k_map(int iter=1, str string='1', bint print_all=True):
    """Calculate iter terms in the binay Look-Knave sequence starting at string.
    """
    cdef str liestring, outstring, glyph
    cdef int truedigit, index, start, end, rlen

    for i in range(iter):
        if print_all:
            print(string)

        liestring = ''

        for index in range(len(string)):             # invert bits of string
            if string[index] == '0':
                liestring = ''.join([liestring, '1'])
            else:
                liestring = ''.join([liestring, '0'])

        end = -1
        string = ''

        while end < len(liestring) - 1:              # describe liestring
            start = end + 1                          # move window
            end = start
            glyph = liestring[start]
            if end < len(liestring) - 2:
                while liestring[end + 1] == glyph:
                    end += 1
                    if end == len(liestring) - 1:
                        break
            rlen = end - start + 1
            string = ''.join([string, str(bin(rlen)[2:]), glyph])
