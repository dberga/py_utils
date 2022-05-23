def obtenerVariedades(ngens,personajes):
    num_variedades = -1
    # Recogiendo variedades
    variedades = [set({}) for n in range(0,ngens)] # Un diccionario por gen
    for (nombre,sexo,genes) in personajes:
        gi = 0
        for copias in genes:
            for v in copias:
                if v not in variedades[gi]:
                    variedades[gi].add(v)
            gi += 1
    return variedades

def carga(config_nf):
    max_personajes_extra = -1
    ngens = -1
    adding = False
    sexos = set(['hombre','mujer'])
    loading_genes = False

    nombre = ''
    sexo = ''
    current_genes = []

    personajes_actuales = []
    for l in file(config_nf): # for each line
        # Eliminar comentario: todo despues del primer ;
        l = l.split(';',1)[0]
        # lowcase. quitar espacios en extremos.
        l = l.lower().strip()
        if l == '': # linea vacia
            continue
        elif loading_genes:
            if ['fin','genes'] == l.split():
                loading_genes = False
                if False:
                    print 'Nombre:',nombre
                    print 'Sexo:',sexo
                    print 'genes',current_genes
                    print 
                if len(current_genes) <> ngens:
                    print 'Error: carga genetica debe tener',ngens,'genes'
                    print (nombre, sexo, current_genes)
                    sys.exit(1)
                personajes_actuales.append( (nombre, sexo, current_genes) )
                nombre = ''
                sexo = ''
                current_genes = []            
            else:
                copias = l.split()
                if len(copias) <> 2: # Deben ser dos copias en 
                    print 'Error. Deben ser dos copias por gen:',copias
                    sys.exit(1)
                current_genes.append( copias )
        elif l.split() == ['***','generacion','inicial']:
            pass
        elif l.split() == ['***','personajes','requeridos']:
            generacion_inicial = personajes_actuales
            personajes_actuales = []
        elif '=' in l:
            l = l.split('=')
            var = l[0].strip().split()
            val = l[1].strip()
            if var == ['max','personajes','extra']:
                max_personajes_extra = int(val)
            elif var == ['num','genes']:
                ngens = int(val)
            elif var == ['nombre']:
                nombre = val
                adding = True
            elif var == ['sexo']:
                sexo = val
                if sexo not in sexos:
                    print 'Error: sexo no definido:',sexo
                    sys.exit(1)
            elif var == ['inicio','genes']:
                loading_genes = True
        else:
            print 'Linea desconocida:',l
    personajes_requeridos = personajes_actuales
    return max_personajes_extra, ngens, generacion_inicial, personajes_requeridos
