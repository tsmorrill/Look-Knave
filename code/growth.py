from knave import k_map

subwords = [10101110, 1010111000, 101011110, 10101111000, 1010111110,
            1110, 111000, 1111000, 111110,
            1111010, 111101000, 111101110, 11110111000, 111101111000,
            11110111110]


ratios = []
for word in subwords:
    now = str(word)
    later = str(k_map(iter=1, string=now, print_all=False))
    ratios.append(len(later)/len(now))
    if len(now) == len(later):
        print(word)
ratios.sort()

print(ratios)
