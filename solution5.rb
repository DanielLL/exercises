def calc(a,b)
  c = 1000 - a - b
  if (c*c === a*a + b*b )&& ( a<b && a<c && b<c)
    puts "a = #{a}"
    puts "b = #{b}"
    puts "c = #{c}"
  end
end
for a in 0..500
  for b in 0..500
    calc(a,b)
  end
end
