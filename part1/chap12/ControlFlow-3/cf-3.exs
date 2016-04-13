defmodule RaiseOrNot do
    def ok!({:ok, value}), do: value
    def ok!({errorCode, errorValue}), do: raise("An unexpected error occured -> #{errorCode} : #{errorValue}")
end