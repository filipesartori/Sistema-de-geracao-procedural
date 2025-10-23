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
    
    preenche_grid(_grid);
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