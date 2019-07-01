def look_knave(iter=1, start=1):
    """Calculate iter terms in the binay Look-Knave sequence starting at start.
    """
    def iteration(truestring):
        liestring = ''
        outstring = ''

        print(truestring)

        for glyph in truestring:
            truedigit = int(glyph)
            if truedigit in range(2):
                liedigit = 1 - truedigit
                liestring += str(liedigit)

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

    truestring = str(start)
    for i in range(iter):
        truestring = iteration(truestring)

    return int(truestring)
