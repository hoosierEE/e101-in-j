NB. assignment is to reassemble the out-of-order packets,
NB. group by messageID and robot name,
NB. and find the average sensor value for each robot
NB. (individual sensor readings come from individual packets)

rip =: [: /:~ ',' cut&> cutLF               NB. cut file into list-of-lists
kid =: {."1 </. }."1                        NB. key by message ID
kbn =: {.L:1 <@;/. ]L:1                     NB. key by robot name
msg =: _3 (([: {:"1 }:)\L:1) _3 }. ]        NB. group by "sensor" messages
avg =: [: (+/ % #)L:0 (".L:0/. >@{:"1 L:1)  NB. compute average of sensor reads for each bot
nms =: {.@{.S:1                             NB. get robot names for final display

result =: (nms,.avg) ':'takeafter L:0 msg kbn kid rip fread 'packets-2.txt'
echo result