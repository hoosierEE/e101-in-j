filename =: 'packets-2.txt'
prep =: [: /:~ ',' cut&> cutLF                                    NB. cut file into list-of-lists
kid =: {."1 </. }."1                                              NB. key by message ID
kbn =: {.L:1 <@;/. ]L:1                                           NB. key by robot name
msgs =: _3 (([: {:"1 }:)\L:1) _3 }. ]                             NB. group by "sensor" messages
avg =: [: (+/ % #)L:0 (".L:0/. >@{:"1 L:1)                        NB. compute average of sensor reads for each bot
nms =: {.@{.S:1                                                   NB. grab robot names 
echo (nms,.avg)':'takeafter L:0 msgs kbn kid prep fread filename  NB. result
