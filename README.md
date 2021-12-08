# Runners
Scripts macros para multi accs no furia.

>1 - Abra o app Termux(https://f-droid.org/repo/com.termux_117.apk) no Android e digite ou cole:

```apt install curl -y```

>2 - Copie e cole este comando para baixar o instalador do twm(O link faz parte do comando):

```curl https://github.com/sharesourcecode/runners/raw/master/installrunners.sh -O -L```

>3 - Copie e cole este comando para instalar o twm:

```bash installrunners.sh```

>4 - Para executar o twm:

```bash runners/play.sh```

Ao executar irá se abrir o editor de texto nano, adicione login;senha como descrito abaixo, separado por ;
Para adicionar mais contas salte um linha para cada, ficará parecido com isto:
```bash
Joao;SenhaDeJoao
Maria;SenhaDeMaria
Luiz Inacio;SenhaDeLuizInacio
```
Para salvar e sair do editor nano use a teclas Ctrl o

Em seguir Ctrl m

E Ctrl x

Para evitar erros e demora na execução não use mais que 30 accs.
Após iniciar a rede tor(aproximadamente 1m) as accs farão login e executarão as tarefas de 20 em 20 minutos.

Não use outros programas de VPN ou a rede tor não iniciará.

Pode-se executar também em modo 12x arena para abrir baús de clã, neste modo só faz login, arena e sai:

```bash runners/fplay.sh```

`Para interroper (CTRL c) ou force a parada do app Termux`
