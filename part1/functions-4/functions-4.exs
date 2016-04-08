prefix = fn prefix ->
    ( fn body -> "#{prefix} #{body}" end)
end