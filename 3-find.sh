# progressive grep

# usage: ./3-find.sh target1 refine1 refine2 ...  

counter=0

cmd_H='  find . -name "*.H"   | xargs grep -sn'
cmd_C='  find . -name "*.C"   | xargs grep -sn'
cmd_h='  find . -name "*.h"   | xargs grep -sn'
cmd_cpp='find . -name "*.cpp" | xargs grep -sn'
cmd_ipp='find . -name "*.ipp" | xargs grep -sn'

for arg
  do
  if [[ "$counter" -eq 0 ]]; then
    counter=$((counter+1))
    cmd_H="${cmd_H} ${arg}     | grep -v lnInclude"
    cmd_C="${cmd_C} ${arg}     | grep -v lnInclude"
    cmd_h="${cmd_h} ${arg}     | grep -v lnInclude"
    cmd_cpp="${cmd_cpp} ${arg} | grep -v lnInclude"
    cmd_ipp="${cmd_ipp} ${arg} | grep -v lnInclude"
  else
    counter=$((counter+1))
    cmd_H="${cmd_H}     | grep ${arg}"
    cmd_C="${cmd_C}     | grep ${arg}"
    cmd_h="${cmd_h}     | grep ${arg}"
    cmd_cpp="${cmd_cpp} | grep ${arg}"
    cmd_ipp="${cmd_ipp} | grep ${arg}"
  fi
done

echo -h,H------------------------------------------
eval $cmd_H
eval $cmd_h
echo -cpp,C-------------------------------------------
eval $cmd_C 
eval $cmd_cpp 
echo -ipp------------------------------------------
eval $cmd_ipp 

