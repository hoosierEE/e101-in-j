NB. assignment is to re-assemble the out-of-order packets,
NB. group by messageID and robot name,
NB. sort the messages into ascending order,
NB. and find the average sensor value for each robot
NB. (individual sensor readings come from individual packets)

NB. The solution for the averages can be done in a 1-line tacit function train:
NB. (0&{::;(+/%#)@>@}.)"1({."1(0 0&{::;".@;@}."1)/.]),.2&{.S:1':'takeafter L:0]3{.({.L:1,@</.])({."1(_1{."1&.><)/.])(".&.>@(2&{.),{:)"1','cut&>cutLF fread'packets-2.txt'

NB. however for more clarity it can be broken up into the main ideas:
f =: ','cut&>cutLF fread'packets-2.txt'     NB. preprocess file
av2 =: (0&{::;(+/%#)@>@}.)"1                NB. average sensor value
cast =: ({."1(0 0&{::;".@;@}."1)/.])        NB. convert sensor readings to integer
kbn2 =: ({.L:1,@</.])                       NB. group by robot name
kmsg2 =: ({."1(_1{."1&.><)/.])              NB. group by message id
ordered =: (".&.>@(2&{.),{:)"1              NB. turn (msgid) and (msgnum) into numbers
part2 =: av2 cast ,. 2&{.S:1':'takeafter L:0] 3{. part1 =: kbn2 kmsg2 sort ordered f

echo 'sorted messages:'
echo part1
echo 'average sensor value:'
echo part2
