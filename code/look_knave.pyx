def k_map(iter=1, start=1, print_all=False):
    """Calculate iter terms in the binay Look-Knave sequence starting at start.
    """
    def iteration(truestring):
        liestring = ''
        outstring = ''

        if print_all:
            print(truestring)


        for glyph in truestring:
            truedigit = int(glyph)
            if truedigit == 0 or truedigit == 1:
                liedigit = 1 - truedigit
                liestring += str(liedigit)

        cdef int i = 0

        while liestring:
            i, glyph = 0, liestring[0]
            while liestring:
                if liestring[0] == glyph:
                    i += 1
                    liestring = liestring[1:]
                else:
                    break
            outstring += str(bin(i)[2:])
            outstring += glyph
        return(outstring)

    cdef string truestring = str(start)
    for int j in range(iter):
        truestring = iteration(truestring)

    return int(truestring)
