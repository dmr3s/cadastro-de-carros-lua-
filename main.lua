local carros = {}
local adc = {}

-- Remove espaços em branco
function limparTexto(texto)
    return string.gsub(texto, "^%s*(.-)%s*$", "%1")
end

-- Verifica se o carro já existe na lista
function carroExiste(nome)
    for _, carro in ipairs(carros) do
        if carro:lower() == nome:lower() then
            return true
        end
    end
    return false
end

-- cadastro
function cadastrarCarro()
    print("\nDigite o nome do carro: ")
    local nome = limparTexto(io.read())

    print("Digite o ano do carro: ")
    local ano = limparTexto(io.read("*n"))

    if nome == "" then
        print("Nome inválido! Tente novamente.\n")
        return
    end

    if ano == "" then
        print("Ano inválido! Tente novamente.\n")
        return
    else
        table.insert(adc, ano)
    end

    if carroExiste(nome) then
        print("Esse carro já está cadastrado.\n")
    else
        table.insert(carros, nome)
        print("Carro '" .. nome .. "' do ano de '" .. ano .. "' cadastrado com sucesso!\n")
    end
end

-- Lista
function listarCarros()
    print("\nCarros cadastrados:")

    if #carros == 0 then
        print("Nenhum carro cadastrado ainda.\n")
    else
        for i, nome in ipairs(carros) do
            print("\n" .. i .. ". " .. nome .. " " .. adc[i])
        end
        print("")
    end
end

-- Remover
function remover()
    print("\nDigite o nome do carro que deseja remover:")
    local nome = limparTexto(io.read())

    for i, carro in ipairs(carros) do
        if carro:lower() == nome:lower() then
            table.remove(carros, i)
            table.remove(adc, i)
            print("Carro '" .. nome .. "' removido com sucesso!\n")
            return
        end
    end

    print("Carro '" .. nome .. "' não encontrado.\n")
end

-- Buscar
function buscarCarro()
    print("\nDigite o nome (ou parte) do carro que deseja buscar:")
    local termo = limparTexto(io.read())

    local encontrados = {}
    for i, carro in ipairs(carros) do
        if carro:lower():find(termo:lower()) then
            table.insert(encontrados, i .. ". " .. carro.. " " .. adc[i])
        end
    end

    if #encontrados == 0 then
        print("Nenhum carro encontrado com esse nome.\n")
    else
        print("Resultados encontrados:")
        for _, resultado in ipairs(encontrados) do
            print(resultado)
        end
        print("")
    end
end

--  Editar
function editarCarro()
    print("\nDigite o nome do carro que deseja editar:")
    local nomeAntigo = limparTexto(io.read())

    for i, carro in ipairs(carros) do
        if carro:lower() == nomeAntigo:lower() then
            print("Digite o novo nome:")

            local nomeNovo = limparTexto(io.read())
            print("Digite o novo ano:")

            local anoNovo = limparTexto(io.read("*n"))
            adc[i] = anoNovo
            carros[i] = nomeNovo
            print("Carro atualizado de '" .. nomeAntigo .. "' para '" .. nomeNovo .. "'.\n")
            return
        end
    end

    print("Carro '" .. nomeAntigo .. "' não encontrado.\n")
end

-- Limpar lista
function limparLista()
    print("\nTem certeza que deseja apagar toda a lista? (s/n)")
    local resposta = io.read()

    if resposta:lower() == "s" then
        carros = {}
        adc = {}
        print("Lista de carros apagada com sucesso.\n")
    else
        print("Operação cancelada.\n")
    end
end

-- Menu
while true do
    print("=== MENU ===")
    print("1 - Cadastrar carro")
    print("2 - Listar carros")
    print("3 - Remover carro")
    print("4 - Buscar carro")
    print("5 - Editar carro")
    print("6 - Limpar lista")
    print("7 - Sair")
    io.write("Opção: ")

    local opcao = io.read()

    if opcao == "1" then
        cadastrarCarro()
    elseif opcao == "2" then
        listarCarros()
    elseif opcao == "3" then
        remover()
    elseif opcao == "4" then
        buscarCarro()
    elseif opcao == "5" then
        editarCarro()
    elseif opcao == "6" then
        limparLista()
    elseif opcao == "7" then
        print("Saindo do programa. Até mais!")
        break
    else
        print("Opção inválida. Tente novamente.\n")
    end
end
