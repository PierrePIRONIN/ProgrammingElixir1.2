fizz_word = fn
 0, 0, _ -> "FizzBuzz"
 0, _, _ -> "Fizz"
 _, 0, _ -> "Buzz"
 _, _, a -> a
end

fizzbuzz = fn n ->
   fizz_word.(rem(n, 3), rem(n,5), n)
end