# Look Knave
Calculate the binary Look-Knave sequence.

The binary Look-Say sequence is defined as follows. Start with 1. Iterate by describing the previous string. So,

'1' is one 1. The next entry is '11'.
'11' is two 1s. Two is '10' in binary. The next entry is '101'.
'101' is one 1, one 0, and one 1. The next entry is '111011'.

And so on.

In Raymond Smullyan's Knights and Knaves puzzles, Knaves will always lie. The binary Look-Knave sequence combines these two ideas. Start with 1. Iterate by asking a Knave to describe the previous string. For the lie to be unambiguous, the Knave simply flips the bits of the string. So,

The Knave says '1' is one 0. The next entry is '10'.
The Knave says '10' is one 0 and one 1. The next entry is '1011'.
The Knave says says '1011' is one 0, one 1, and two 0s. Two is '10' in binary. The next entry is '1011100'.

And so on.
