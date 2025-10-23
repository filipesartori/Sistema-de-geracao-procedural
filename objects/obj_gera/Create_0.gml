//Definindo o tamanho da room
tamanho_base = sprite_get_width(spr_parede);

//Criando metodo que incia a room
inicia_room = function (){
    //usando o tamnho base apra determinar o tamanho da room
    var _larg = tamanho_base * irandom_range(50, 400);

    //Matendo a proporcao em relacao a largura
    var _alt = _larg div 1.777777777777778;
    
    room_width = _larg;
    room_height = _alt;
    
    //Criar um ds grid e preenche-la
    var _cols = _larg div tamanho_base;
    var _lins = _alt div tamanho_base;
    var _grid = ds_grid_create(_cols, _lins);
    
    //Preenchendo a grid
    ds_grid_clear(_grid, 1);
    
    //Passando pela grid
    _grid = esburaca_grid(_grid);
    
    preenche_grid(_grid);
    
    //Criando player no meio da grid
    instance_create_layer((_cols div 2) * tamanho_base + 8, (_lins div 2) * tamanho_base + 8, "Player", obj_player);
}

esburaca_grid = function (_grid) {
    var _cols = ds_grid_width(_grid);
    var _lins = ds_grid_height(_grid);
    var _repete = irandom_range(_cols * 10, _cols * 100);
    
    //Criando o level
    //Iniciar o X do level no meio dele
    var _x = _cols div 2;
    var _y = _lins div 2;
    
    //Limpando a poiscao do _x e _y
    _grid[# _x, _y] = 0;
    
    //Definindo a direcao para onde vou andar
    var _dir = irandom(3);
    
    repeat (_repete) {
    	//Mudando minha direcao com base na minha _dir
        switch (_dir) {
        	case 0: _x += 1; break; //Diretia
        	case 1: _y -= 1; break; //Cima
        	case 2: _x -= 1; break; //Esquerda
        	case 3: _y += 1; break; //Baixo
        }
        
        //Garantindo que o _x e _y nao saia da room
        _x = clamp(_x, 1, _cols - 2);
        _y = clamp(_y, 1, _lins - 2);
        
        //Limpando minha posicao na grid
        _grid[# _x, _y] = 0;
        
        //Definindo uam, chance de mudar a direcao
        var _chance = random(100)
        
        if (_chance > 50) {
        	_dir = irandom(3);
        }
        //Mudando a direcao
        
    }
    return _grid;
}

//Preenche grid
preenche_grid = function (_grid){
    for (var i = 0; i < ds_grid_height(_grid); i++) {
    	for (var j = 0; j < ds_grid_width(_grid); j++) {
        	//Olhar cada celula da minha grid se nessa celula tem o numero um eu crio uma parede
            var _celula = _grid[# j, i];
            if (_celula) {
            	instance_create_layer(j * tamanho_base, i * tamanho_base, "Instances", obj_parede);
            }
            
        }
    }
}

inicia_room();