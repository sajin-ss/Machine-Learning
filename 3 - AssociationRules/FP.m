function  [FreqItemsets]  = FP( )

load Transactions
minSup = 0.2;

[FreqItemsets] = freq_Patt(Karate, minSup);
end

