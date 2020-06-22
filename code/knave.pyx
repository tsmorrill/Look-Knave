def k_map(iter=1, start=1, print_all=False):
    """Calculate iter terms in the binay Look-Knave sequence starting at start.
    """
    def iteration(truestring):
        cdef str liestring = ''
        cdef str outstring = ''

        if print_all:
            print(truestring)

        cdef int truedigit, index

        for index in range(len(truestring)):
            truedigit = int(truestring[index])
            if truedigit in range(2):
                liedigit = 1 - truedigit
                liestring = ''.join([liestring, str(liedigit)])

        cdef int i
        cdef str glyph
        while liestring:
            i, glyph = 0, liestring[0]
            while liestring:
                if liestring[0] == glyph:
                    i += 1
                    liestring = liestring[1:]
                else:
                    break
            outstring = ''.join([outstring, str(bin(i)[2:]), glyph])
        return(outstring)

    cdef str truestring = str(start)
    for i in range(iter):
        truestring = iteration(truestring)

    return int(truestring)
