echo '[^(distros.txt)]*'
ls
rm distro_dates.txt 
ls 'distros*'
ls
cat -A distros.txt 
vim distros.txt 
cat -A distros.txt 
cut -f 3 distros.txt 
cut -f 1,2 distros.txt >distro_vers.txt
cut -f 3 distros.txt >distro_dates.txt
paste distro_dates.txt distro_vers.txt 
cat distro_vers
cat distro_vers.txt 
ls
rm distros_by_date.txt 
ls
rm distro_versions.txt 
ls
cut -f 2 distros.txt 
cut -f 2 distros.txt >distronum.txt
paste distro_dates.txt distronum.txt 
paste distro_dates.txt distronum.txt >numbers.txt
ls
cat distro_vers.txt 
cat * | less
cut -f 1 distros.txt >distro_names.txt
paste distro_dates.txt distro_names.txt >names.txt
cat names.txt 
join numbers.txt names.txt 
join names.txt numbers.txt 
cd ~/ProgrammingPython/System/Implementation/
cd -
cd ~/Documents/PP4E/Launcher.py 
vim ~/Documents/PP4E/Launcher.py 
vim ~/Documents/PP4E/launchmodes.py 
vim ~/Documents/PP4E/LaunchBrowser.pyw 
ls
cat >file1.txt
cat >file2.txt
comm file1.txt file2.txt 
cat >file1.txt
cat >file2.txt
comm file1.txt file2.txt 
cat file2.txt 
cat >file1.txt
cat >file2.txt 
comm file1.txt file2.txt 
comm -n 12 file1.txt file2.txt 
comm -12 file1.txt file2.txt 
diff file1.txt file2.txt 
diff -c file1.txt file2.txt 
xdg-open Downloads/The\ Linux\ Command\ Line_\ A\ Complete\ Introduction.pdf 
cd playground/
ls
ls '[^(distros.txt)]'
ls '(distros.txt')*
ls '(distros.txt)'*
ls 'distros.txt'
ls '!distros.txt'
man bash
find ~/playground -type f -not -name 'distros.txt'
cat -A distros.txt
find ~/playground -type f -not -name 'distros.txt'
find ~/playground -type f -not -name 'distros.txt' | rm -v
find ~/playground -type f -not -name 'distros.txt' -exec rm -v '{}' '+'
ls
cat -A distros.txt 
cut -f 3 distros.txt 
cut -f 1
cut -f 1 distros.txt 
cut -f 2 distros.txt 
cut -f 3 distros.txt 
cut -f 3 distros.txt | cut -c 7-10
cut -f 3 distros.txt | cut -c 7-
cat /etc/passwd | head
cut -f 1 -d ':' /etc/passwd | head
aspell
spell
ispell
yay -S aspell
aspell distros.txt 
aspell check distros.txt 
aspell -h
aspell --help
aspell -d 'en_US' check distros.txt 
ls /usr/lib/aspell-0.60/
aspell ccpp distros.txt 
aspell check ccpp distros.txt 
aspell check -ccpp distros.txt 
aspell --add ccpp
aspell check --add ccpp
ls
cut -f 3 distros.txt | cut -c 7-
expand distros.txt | cut -c 23-
# sort the list by date
# cut off the distro names and their versions
# insert the dates as the first column
du -h distros.txt 
du distros.txt 
vim distros.txt 
wc distros.txt 
du /
man du
du -s /
sudo du -s /
sudo du -sh / 2>/dev/null
df -h
ls
vim reform.sh
vim reform.sh 
chmod +x reform.sh 
ls
./reform.sh 
ls
vim reform.sh 
cat distros.txt | head
./reform.sh | head
file reform.sh 
vim reform.sh 
file reform.sh 
./reform.sh 
vim reform.sh 
file reform.sh 
man file
unix2dos distros.txt -o dos.txt
ls
file distros.txt 
vim distros.txt 
cat -A distros.txt 
dos2unix distros.txt 
cat -A distros.txt 
vim distros.txt 
ls
mkdir join
cp distros.txt join/
ls
cd join
ls
cmp distros.txt ../distros.txt 
echo $status
cmp distros.txt ../distros.txt -lf
cmp distros.txt ../distros.txt -l
cmp distros.txt ../distros.txt | cat -A
echo ($status)
echo $(echo $status))
echo $(echo $status)
ls
cd ..
ls
rm join/
man unlink
unlink join
rm -r join
ls
vim table.sh
bash reform.sh 
ls
bash table.sh
vim table.sh 
ls
./table.sh
bash table.sh
vim table.sh
ls
chmod +x table.sh 
./table.sh 
ls
head table1.txt 
head table2.txt 
less reform.sh 
vim reform.sh 
vim table.sh 
./table.sh 
ls
vim table.sh 
./table.sh 
vim table.sh 
./table.sh 
ls
systemctl suspend
ls
./table.sh 
./reform.sh 
ls
cat distros.txt | head
./reform.sh | head
cd ~/C/Data\ Structures\ And\ Algorithms/Stacks/
ls
vim todo.out 
ls
vim reverseList.c
gcc reverseList.c 
./a.out 
vim reverseList.c
gcc reverseList.c 
./a.out 
vim reverseList.c
gcc reverseList.c 
./a.out 
vim reverseList.c
gcc reverseList.c 
./a.out 
vim reverseList.c
gcc reverseList.c 
./a.out 
vim reverseList.c
gcc reverseList.c 
./a.out 
vim reverseList.c
gcc reverseList.c 
./a.out 
vim reverseList.c
gcc reverseList.c 
./a.out 
vim reverseList.c
gcc reverseList.c 
./a.out 
vim reverseList.c
gcc reverseList.c 
./a.out 
vim reverseList.c
vim todo.out 
find ~/C -type f -iname '*fix*.c'
find ~/C -type f -iname '*postfix*.c'
find ~/C -type f -iname '*.c' -exec grep 'postfix' '{}' '+'
find ~/C -type f -iname '*.c' -exec grep 'infixfix' '{}' '+'
find ~/C -type f -iname '*.c' -exec grep =i 'infixfix' '{}' '+'
find ~/C -type f -iname '*.c' -exec grep -i 'infix' '{}' '+'
find ~/C -type f -iname '*.c' -exec grep -i 'postfix' '{}' '+'
vim todo.out 
gcc infixToPostfix.c 
./a.out 
./a.out 1                                       2
./a.out 
./a.out 1
./a.out                                                  3
./a.out 
vim todo.out 
vim infixToPostfix.c 
ls
vim reverseList.c 
ls
vim infixToPostfix.c 
gcc infixToPostfix.c 
vim reverseList.c 
vim infixToPostfix.c 
vim reverseList.c 
gcc reverseList.c 
vim reverseList.c 
gcc reverseList.c 
vim reverseList.c 
gcc reverseList.c 
vim reverseList.c 
gcc reverseList.c 
vim reverseList.c 
gcc reverseList.c 
vim reverseList.c 
gcc reverseList.c 
./a.out 
vim reverseList.c 
gcc reverseList.c 
./a.out 
vim reverseList.c 
./a.out 
gcc reverseList.c 
./a.out 
vim reverseList.c 
gcc reverseList.c 
./a.out 
vim reverseList.c 
gcc reverseList.c 
./a.out 
cd playground/
ls
cat >file1.txt
cat >file2.txt
comm file1.txt file2.txt 
diff file1.txt file2.txt 
diff -c file1.txt file2
diff -c file1.txt file2.txt 
diff -u file1.txt file2.txt 
diff -Naur file1.txt file2.txt 
diff -Naur file1.txt file2.txt >patchfile.txt
ls
patch <patchfile.txt 
cat file1.txt 
cat >file1.txt 
diff -u file1.txt file2.txt 
diff -Naur file1.txt file2.txt 
diff file1.txt 
diff -u file1.txt file2.txt >patchfile.txt
patch <patchfile.txt 
cat file1.txt 
echo "lowercase letters" | tr a-z A-Z
echo "lowercase letters" | tr [:lower:] A
echo "lowercase letters" | tr a-z A
unix2dos file1.txt 
vim file1.txt 
cat -A file1.txt 
tr -d '\r' <file1.txt >file1unix.txt
cat -A file1unix.txt 
tr '\r' '' <file1.txt >file1unix.txt 
tr -d '\r' <file1.txt >file1unix.txt 
cat -A file1unix.txt 
echo "aaabbbccc" | tr -s
echo "aaabbbccc" | tr -s ab
echo "aaabbbccc" | tr -s abc
echo "abcabcabc" | tr -s abc
echo "this is fine" | tr a-mn-z n-za-m
echo "guvf vf svar" | tr a-mn-z n-za-m
echo "secret text" | tr a-mn-z n-za-m
systemctl suspend
yay
man yay
yay -c
man yay
yay -Sc
man yay
yay -Yc
yay -Sc
df -h
$((48-53))
echo $((48-53))
echo "front" | sed "s/front/back"
echo "front" | sed "s/front/back/"
echo "frontfront" | sed "s/front/back/"
echo "frontfront" | sed "s/front/back/g"
echo "front" | sed "s_front_back_"
echo "front" | sed "1s/front/back/"
echo "front" | sed "2s/front/back"
echo "front" | sed "2s/front/back/"
echo "\nfront\n" | sed "2s/front/back/"
printf "\nfront\n"
echo "\nfront\n"
printf "\nfront\n" | wc -l
printf "\nfront\n" | sed "2s/front/back/"
# print first 5 lines in distros
sed -n "1,5p" distros.txt 
sed "1,5p" distros.txt 
sed "1,5p" distros.txt | wc -l
cat distros.txt | wc -l
sed -n "1,5p" distros.txt 
cat distros.txt | head 4
cat distros.txt | head -4
cat distros.txt | head -1
# print only the SUSE lines
sed -n "/SUSE/p" distros.txt 
sed "/SUSE/" distros.txt 
sed "/SUSE/p" distros.txt 
sed -n "/SUSE/p" distros.txt 
# no suse
sed -n "/SUSE/!" distros.txt 
sed -n "/SUSE/printf "\nfront\n" | sed "2s/front/back/"" distros.txt 
echo printf "\nfront\n" | sed "2s/front/back/"
sed -n '/SUSE/!p' distros.txt 
sed 's/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\)\{4\}/\3-\1-\2/' distros.txt 
sed 's/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\)/\3-\1-\2/' distros.txt 
sed 's/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\)$/\3-\1-\2/' distros.txt 
echo "aaabbbccc" | sed 's/b/B/g'
ls
echo ^file*.txt
ls ^file*.txt
ls file*.txt
ls [^file]*.txt
ls ^[file]*.txt
ls file*.txt
rm file*.txt
ls
vim distreport.sed
ls
sed -f distreport.sed distros.txt 
vim distreport.sed
sed -f distreport.sed distros.txt 
vim distreport.sed
sed -f distreport.sed distros.txt 
vim distreport.sed
sed -f distreport.sed distros.txt 
vim distreport.sed
sed -f distreport.sed distros.txt 
cat distros.txt 
sed -f distreport.sed distros.txt 
sed -f distreport.sed distros.txt | cat -n
vim distreport.sed
sed -f distreport.sed distros.txt | cat -n
aspell check distros.txt 
ls
cp distros.txt distros2.txt
sed -i 's/FEDORA/fedindt/; s/SUSE/sussybaka/' distros2.txt 
cat -n distros2.txt 
rm distros2.txt 
ls
cd playground/
ls
nl distreport.sed 
cat -n distreport.sed 
man nl
yay
ls
nl distreport.sed 
cat -n distreport.sed 
sed -i '3i/\\:\\:\\:/' distreport.sed 
cat -n distreport.sed 
man sed
sed -d 3 distreport.sed 
vim distre
vim distreport.sed 
cat -n distreport.sed 
sed -ai 3 '\\:\\:\\' distreport.sed 
sed -ai '3\\:\\:\\' distreport.sed 
sed -ai '3 \\:\\:\\' distreport.sed 
sed -ai '3/\\:\\:\\' distreport.sed 
sed -ai '3/\\:\\:\\/' distreport.sed 
sed -i '3i \\:\\:\\' distreport.sed 
cat -n distreport.sed 
vim distreport.sed 
cat -n distreport.sed 
sed -i '3a \\:\\:\\' distreport.sed 
cat -n distreport.sed 
vim distreport.sed 
htop
terminator
vim distreport.sed 
ls
sort -k 1,1 -k 2n distros.txt | sed -f distreport.sed | nl
sort -k 1,1 -k 2n distros.txt | sed -f distreport.sed
sort -k 1,1 -k 2n distros.txt | sed -f distreport.sed | nl
sort -k 1,1 -k 2n distros.txt | sed -f distreport.sed | nl -n rz
yay -S i3
echo "exec i3" >> ~/.xinitrc
yay -S xorg-server xorg-xinit
sudo reboot
ls
cd playground/
ls
sort -k 1,1 -k 2n distros.txt | sed -f distreport.sed | nl -w 3 -s ' '
echo "The quick brown fox jumps over the lazy dog." | fold -w 12
echo "The quick brown fox jumps over the lazy dog." | fold -w 12 -s
etcher
man etcher
info fmt
info fmt | vim
info fmt >info.txt
less info.txt
wc info.txt 
cd ~/C
git status
git log --oneline
git commit -m 'start: stacks'
git push
cd ~/ProgrammingPython/
ls
git status
cd System/Implementation/
ls
git log --oneline
git status
cd ~/CPP/
ls
git status
cd -
git status
cd ~/C
git status
cd ~/playground/
ls
fmt -w 50 info.txt 
fmt -w 80 info.txt | head
fmt -w 0 info.txt | head
fmt -w -2 info.txt | head
fmt -w 32 info.txt | head
fmt -w 50 info.txt 
fmt -w 50 info.txt | head
fmt -cw 50 info.txt 
reboot
ls
ls -a
ls .i3
zsh
lsblk
sudo mount /dev/sdb1 /mnt
ls /mnt/LinuxBackup/
ls /mnt/LinuxBackup/ananyobrata/
ls /mnt/LinuxBackup/ananyobrata/ -l
ls /mnt/LinuxBackup/ananyobrata/ -A
cd /mnt/LinuxBackup/ananyobrata/
ls
la -a
ls -a
ls .config/
yay -s
man yay
ls
ls .config/
ls .config/ --color=no
vim .config/i3-scrot.conf 
ls -a
ls -a
sudo cp -r .bash_history .bashrc .conkyrc .i3status.conf .lesshst .python_history .vimrc .zhistory .zshrc ~/
cp -r .i3 ~/
lsblk
sudo umount /mnt
fdisk -l /dev/sda
sudo fdisk -l /dev/sda
reboot
which zsh
sudo chsh -s /usr/bin/zsh ananyobrata
yay -S alacritty
yay -S feh
feh
ls
timedatectl
timedatectl set-timezone Asia/Kolkatat
timedatectl set-timezone Asia/Kolkata
timedatectl
timedatectl set-ntp true
timedatectl
mhwd-kernel -i linux516 rmc
sudo mhwd-kernel -i linux516 rmc
vim .i3/config 
ls -a
la
vim /mnt/LinuxBackup/ananyobrata/.fehbg 
ls
ls -a
vim .zhistory 
lsblk
sudo mount /dev/sdb1 /mnt
ls /mnt
ls -a /mnt 
ls -a /mnt --color=no
ls -a /mnt/LinuxBackup/ --color=no
ls -a /mnt/LinuxBackup/ananyobrata/ --color=no
cd /mnt/LinuxBackup/ananyobrata/
ls
ls --color=no
ls --color=no -a
sudo cp -r betaCode bin C CPP .fehbg playground ProgrammingPython ~/
cp source_codes ~
sudo cp -r source_codes ~
sudo umount /mnt
lsbkl
lsblk
sudo umount /dev/sdb1
shutdown now
printenv PATH
new.sh
foo="yes"
echo foo
echo $foo
echo $foo1
echo ${foo}1
echo "$nice"
echo nice
echo $nice
echo
foo=foo.txt
foo1=foo1.txt
cp $foo $fool
cp $foo "$fool"
nameprint "$fool"
nameprint "$foo"
echo "$foo"
vim ~/bin/nameprintpy 
nameprintpy "$foo"
vim ~/bin/nameprintpy 
nameprintpy "$foo"
nameprintpy "$foo" sajdfk sadfsdfsad asdf
vim ~/bin/nameprintpy 
nameprintpy "$foo" sajdfk sadfsdfsad asdf
vim ~/bin/nameprintpy 
nameprintpy "$foo" sajdfk sadfsdfsad asdf
vim ~/bin/nameprintpy 
nameprintpy "$foo" sajdfk sadfsdfsad asdf
vim ~/bin/nameprintpy 
nameprintpy "$foo" sajdfk sadfsdfsad asdf
mv ~/bin/nameprintpy ~/bin/arganalyze
arganalyze "$foo"
systemctl suspend
foo=yes
arganalyze $foo
arganalyze $fool
arganalyze ${foo}l
arganalyze "$fool"
arganalyze $fool
yay
yay -R python3.10
python3.10
yay -R python3.10
yay -R python310
ls
python
arganalyze "foo"
arganalyze "$foo"
arganalyze $foo
$HOSTNAME
echo $HOSTNAME
declare -r THIS="Don't change"
THIS
echo $THIS
THIS=SD
this=a string
echo $this
arganalyze $this
this=a string
arganalyze $this
this="a string"
arganalyze $this
arganalyze "$this"
a=z
b="a string"
c="a string and $b"
echo $c
ls
cd playground/
ls
vim reform.sh 
mv dist* patchfile.txt *.sh ~/ShellScript/LinuxCommandline/
ls
foo="foo.txt"
touch $foo
touch "$foo"
echo "$d"
arganalyze "$c"
d="$(ls -l $foo)"
arganalyze "$d"
arganalyze $d
d="$(ls -l $no)"
alias aa=arganalyze
aa d
aa $d
d=$(ls -l $no)
aa $d
d="$(cmp $no $foo)"
aa $d
aa "$d"
aa "$(cmp $no $foo)"
aa "$(cmp \"$no\" \"$foo\")"
aa "$(cmp "$no" "$foo")"
aa $d
d="$(ls -l $foo)"
aa $d
aa "$d"
e=$((5 * 7))
aa $e
f="\t\ta string\tOk\n"
echo f
printf %s $f
echo $f
printf %s "$f"
a=5 b="a string"
aa $a
aa $b
aa "b"
aa B
aa $B
aa "$B"
a=this b=that c=ok
aa $a $b $c
filename="myfile"
touch "$filename"
mv "$filename $filename1"
aa "$filename $filename1"
aa "$filename" "$filename1"
aa "$filename ${saf}"
aa "$filename \"${saf}\""
aa "$filename" "$filename1"
aa ""$filename" "$filename1""
aa ""$filename" "${filename}1""
date +"%x %r %Z"
cal
$CURRENT_TIME
$USER
aa $USER
git -C ~/ShellScript/ status
cat << _EOF_
$foo
"$foo"
'$foo'
\$foo
_EOF_

cd ~/ShellScript/LinuxCommandline/
chmod +x ftpheredoc.sh 
./ftpheredoc.sh 
ls
tar xztf debian-cd_info.tar.gz 
tar xtf debian-cd_info.tar.gz 
tar ztf debian-cd_info.tar.gz 
ls
rm debian-cd_info.tar.gz 
ls
c
cd
x=5
if [ "$x" -eq 5 ]; then echo "x equals 5"; else echo "x not equals 5"; fi
if [ "$x
if [ "$x" -ne 5 ]; then echo "not equal 5"; else echo "not not equal 5"; fi
[
[ "$x" -e 5]
[ "$x" -e 5 ]
[ "$x" -e 5 ];
[ "$x" -eq 5 ]
echo $status
vim ~/.bashrc
aa $status
source ~/.bashrc
aa $status
aa "$status"
x=6
if [ "$x" -eq 6 ]; then echo "equals 5"; else echo "not equal"; fi
echo $?
[ "$x" -eq 5 ]
echo $?
zsh
ls -d /bin/usr
aa $?
git -C ~ status
true
aa $?
false
echo $?
which aa
where aa
whereis aa
which aa
type aa
if true; then echo "It's true."; fi
if true; then echo "Thi sis nice"; fi
if false; then echo "This is nice"; else echo "this is else"; fi
true; false
echo $?
false; true
echo $?
test false
echo $?
test true
echo $?
if test true; then echo "nice"; fi
if test false; then echo ok; else echo "not ok"; fi
if [ false ]; then echo ok; else echo not; fi
if [ true ]; then echo ok; else echo not; fi
ls
aa $(test false)
aa $(test true)
aa $?
test false
echo $?
aa "this"
aa $((3 % 2))
aa ((3 % 2))
echo ((3 % 2))
echo $((3 % 2))
./int3.sh 
vim int2.sh 
read
echo $READ
echo $REPLY
del
REPLY='NOT'
echo $REPLY
read
echo $REPLY
ls
./range.sh 
man ((
man (
man "("
man "(("
./range.sh 
exit 1
zsh
echo $?
cd ShellScript/LinuxCommandline/
ls
vim int3_test.sh; chmod +x int3_test.sh
ll int3_test.sh 
vim int3_test.sh 
id -u
sudo id -u
read this
echo $this
aa "this is "$this""
aa "this "" that "
aa "htat" and "this"
aa "tath "$this" is"
aa "that \"$this\" is "
aa
aa $thidfd
./int2.sh 
./int2.sh 2>/dev/null
./int2.sh >/dev/null
FILE=foo.*
echo $FILE
FILE=foo.bar
if [[ $FILE == foo.* ]]; then echo "$FILE matches pattern"; else echo "$FILE doesn't match pattern"; fi
echo 3 | watch ./int2.sh 
echo 3 > inp
cat inp
vim inp
watch ./int2.sh <inp
man watch
watch ./int2.sh -x <inp
if ((1)); then echo "true"; else echo "false"; fi
history | less
if ((0)); then echo "true"; else echo "false"; fi
vim int3.sh; chmod +x int3.sh
ll int3.sh 
vim int3.sh 
vim range.sh; chmod +x range.sh
vim range.sh 
vim range.sh
ll
rm inp
ll
find -not *.sh
find -not -name *.sh
find -not -name "*.sh"
find -type f -not -name "*.sh"
find -type f -not -name "*.sh" -exec chmod -x '{}' '+'
ll
git status
git log
git add -A
git log
git status
[[
which [[
type [[
vim int3.sh
vim sys_info_page.sh 
echo -e 'this'
echo 'this'
man echo -e
echo 'this\n'
echo -e 'this\n'
echo "foo" | read
echo "$REPLY"
echo "nom" | read var
echo "$var"
echo $var
echo "$var"
# find characters
aa (( $(( "this is" > 1 )) ))
aa (( "this is" > 1 ))
if (( "this is" > 1 )); then echo "this"; fi
if (( "2" > 1 )); then echo "this"; fi
if (( "-9" > 1 )); then echo "this"; fi
if (( "-9" > 1 )); then echo "this"; else echo "that"; fi
htop
[[ !=~
man [[
if [[ "this" !=~ "this" ]]; then echo 'nice'; fi
if [[ "this" =~ "this" ]]; then echo 'nice'; fi
ls
touch /tmp/-
ls /tmp
vim /tmp/-
rm /tmp/-
ls
ls -clt
vim user-details.sh 
./user-details.sh 
sfkj
./user-details.sh 
echo $?
touch /tmp/-34.34
ls /tmp
file /tmp/*
vim /tmp/-34.34 
file /tmp/*
function example { args: string furstname } {; echo 'this'; }
example
example 34
vim betaCode/shellparam.sh
cd betaCode/
ls
chmod +x shellparam.sh 
./shellparam.sh 
vim shellparam.sh 
vim /tmp/param.sh; chmod +x /tmp/param.sh
/tmp/param.sh 
vim /tmp/param.sh 
/tmp/param.sh 
# I was applying pointer subscript (ptr[0]) for a null ptr, that threw seg fault
wc -w <<< $not
wc -w <<<
set -o vim
set -o vi
this is niceas
:q
