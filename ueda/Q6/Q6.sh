#bin/sh

# Q6-1. 次の文字列について、濁点の文字、半濁音の文字、その他の文字(記号含む)の数を数えてください
# 「どんどこどん、ぱらぱっぱ、ぴろぴろぴー、すっとこどっこい。」

$ echo どんどこどん、ぱらぱっぱ、ぴろぴろぴー、すっとこどっこい。| sed 's/./\n&/g'| nkf -h2 | nkf -Z4 | sed 's/./& /' | awk 'NF==2{print $2} NF==1{print "_"}' | sort | uniq -c
# Q6-2. 2つのファイルを横にくっつけてください
# // ファイルA
# 犬もおだてりゃ
# 論より
# 年寄りの
# テキサス
---
# // ファイルB
# 織田信長
# 暴力
# トライアスロン
# クローバーホールド
---
# // 出力結果
# 犬もおだてりゃ織田信長
# 論より暴力
# 年寄りのトライアスロン
# テキサスクローバーホールド

$ awk '{print FNR,$0}' q2_fileA.txt q2_fileB.txt | sort -s -k1,1 | awk 'NR%2==0{print $2}NR%2==1{printf $2}'

# Q6-3. 次のechoから始めて、4つの数字の間に+-*/の符号を入れ、100になる計算式をワンライナーで作ってください。
# echo 56 2 8 9

$ echo 56 2 8 9 | awk '{while(1){print "+ - * /", $0}}' | awk '{print $5 $(rand()*4+1) $6 $(rand()*4+1) $7 $(rand()*4+1) $8}' | while read ln; do A=$(echo $ln| bc);echo $ln $A;done |awk '$2==100{print $0;exit(0)}'

# Q6-4. https://ja.wikipedia.org/wiki/ISO_3166-1 のページから、
# アイスランド IS
# アイルランド IE
# アゼルバイジャン AZ
# アフガニスタン AF
# のように、国名と2レターコードの対のリストを作りましょう。

$ curl https://ja.wikipedia.org/wiki/ISO_3166-1 2> /dev/null | awk '/<table class="sortable/,/<\/table>/' | awk '/<tbody>/,/<\/tbody>/' | awk '/<td>/,/<\/td>/' | sed 's;.*>\(..*\)</a></td>;\1;' | sed 's;.*>\(..*\)</code></td>;\1;' | awk 'NR%7==1{printf $1" "}NR%7==4{print}'

# Q6-5. 延々とフィボナッチ数を出力するワンライナーを記述してください。ただし桁数が増えてもなるべく正確に。

$ a=0;b=1; while :; do c=$(echo "$a+$b" | bc | tr -d '\n\'); echo $a;a=$b;b=$c; done

# Q6-6. 

$ 

# Q6-7. 

$ 