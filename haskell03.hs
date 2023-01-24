-- colocando .. dentro de [] pode usar equações dentro, por que resultam em valores que ainda fazem parte da lógica contínua de formação. Primeiro coloca o padrão e depois o fim da lista.
-- lista compreensão: [ <expressao> | <lista geradora> ] um exemplo sendo:

testecrialista x = [x*2 | x <- [0..x]] -- vai somando de um em um quando não se tem padrão. pode repetir o x, ele é o nosso argumento e depois vira o x da outra função geradora do lado. mesma lógica do map em questão de receber argumentos. importante a parede |

-- pode ser também espertinho e só tacar um map ao invés dessa sintaxe boba:
testecrialista2 x = map (*2) [0..x] -- faça *2 com argumentos da lista geradora

testecrialista3 = [x | x <- [2,3,5,7,11], x >= 4] -- pode também se usar um argumento de if depois da vírgula, equivale a um filter. o x pega da lista, ele não vem de fora, só o que vem de fora é o que está dentro da lista.

testecrialista4 = filter (>=4) [2,3,5,7,11] -- nem precisa do x nesse caso

-- a lista tamb[em pode ser criada com varios argumentos simultaneos

testecrialista5 = [ x+y | x <- [0..2], y <- [10,11]]

--isso é equivalente a varios maps juntos
add10toall :: [Int] -> [Int]
add10toall lista = [x+10 | x <- lista]

multN :: Int -> [Int] -> [Int]
multN n lista = [x*n | x <- lista]

multN' :: Int -> [Int] -> [Int]
multN' n lista = map (\x -> x*n) lista

applyExpr :: [Int] -> [Int]
applyExpr lista = [3*x+2 | x <- lista]

applyExpr' :: [Int] -> [Int]
applyExpr' lista = map (\x -> 3*x+2) lista

addSuffix :: String -> [String] -> [String]
addSuffix sufixo lista = map (\lista -> lista ++ sufixo) lista 

selectgt5 :: [Int] -> [Int]
selectgt5 lista = [x | x <- lista, x > 5]

f x y = x + y
--teste_foldl :: [Int] -> Int
--teste_foldl lista = foldl1 (\x y -> x + y) lista

--crialista x = [x | x <- [2,3,5,7,11], (\x -> x )]


sumOdds :: [Int] -> Int
sumOdds lista = foldl1 (\x y -> x + y) [x | x <- lista, odd x] -- foldl1 recebe uma função que vai receber dois argumentos da mesma lista (o que é primeiro e o segundo) e vai fazer algo com eles. o segundo argumento é a lista em si.

sumOdds' :: [Int] -> Int
sumOdds' lista = foldl1 (\x y -> x + y) (filter (odd) lista)


testeif :: Int -> Bool
testeif x = x>=20 && x<=50

selectExpr :: [Int] -> [Int]
selectExpr lista = [x | x <- lista, x>20 && x<50]

countShorts :: [String] -> Int
countShorts lista = length [x | x <- lista, length x < 5]

calcExpr :: [Float] -> [Float]
calcExpr lista = [x^2/2 | x <- lista, x^2/2>10]

trSpaces' :: String -> String
trSpaces' string = map (\x -> if (x == ' ') then ('-') else x) string

--map (\x -> if (even x) then (x `div` 2) else x) [1,2,3,4]
--[if (even x) then (x `div` 2) else x | x <- [1,2,3,4]]

--auxilio :: String -> String
--auxilio y = y ++ ' '

trSpaces :: String -> String
trSpaces string = [if (x == ' ') then ('-') else x| x <- string]

--trSpaces :: String -> String
--trSpaces string = [x == ' ' then '-' | x <- string]

--trSpaces :: String -> String
--trSpaces string = [x | x <-['-' | x <- string, x == ' '], y<-string]

-- que receba uma string e converta espaços (' ') em traços ('-'). Use list comprehension. Era só usar map e funções com if.


selectSnd :: [(Int,Int)] -> [Int]
selectSnd tupla = [snd x | x <- tupla]

somatuplas :: (Int, Int) -> Int
somatuplas tupla = fst tupla + snd tupla

dotProd :: [Int] -> [Int] -> Int
dotProd lista lista2 = foldl1 (\x y -> x + y) (map (somatuplas) (zip ([x |x <- lista, even x]) ([x |x <- lista2, even x])))

--Usando a função zip com list comprehension e outras funções auxiliares, escreva uma função dotProd :: [Int] -> [Int] -> Int que calcule o somatório dos produtos dos pares de elementos de duas listas, conforme o exemplo:

-- > dotProd [1,1,1,1] [2,2,2,2] -- 1*2 + 1*2 + 1*2 + 1*2
--8

testedivisao x y = rem x y -- o que vai ser dividido depois o divisor, retorna o quociente

main = do
  putStrLn "Hello"
  putStrLn "World"
