program carreMagique;
//BUT:      creer un carre magique impaire
//ENTRER:   nbr impaire en constante pour le tableau
//SORTIE:   les nummero dans le carre magique
uses crt;

CONST
    tailleCareer=5;

TYPE
    tblC=array[1..tailleCareer,1..tailleCareer] of integer;

FUNCTION initnbr (n:integer):integer;
//BUT:   racine carrer de la const 
//ENTRER: nbr
//SORTIE: racine carrer
begin
    initnbr:=n*n;
end;

FUNCTION initTbl (nbr:integer):tblC;
//BUT:   initiation de la map avec des zero
//ENTRER: nbr
//SORTIE:  la map plien de 0
VAR i,j:integer;
begin
    for i:=1 to nbr do
        for j:=1 to nbr do
            initTbl[i,j]:=0;
end;

PROCEDURE afficheCarre (t:tblC;nbr:integer);
//BUT:   afficher le tbl 
//ENTRER: le tbl et la taille du tbl
//SORTIE: 
VAR i,j : integer;
begin
    for i:=1 to nbr do
    begin
        for j:=1 to nbr do
        begin
            gotoxy(i*4,j*3);
            write (t[i,j]);
        end;
    end;
end;

FUNCTION RempTbl (t:tblC;nbr,nMax:integer):tblC;
//BUT:  remplacer les 0 par le nombre corespendan pour creer le carreMagique
//ENTRER: map,nbr de la taille du Career et nbr maximal a atteindre
//SORTIE: carrer magique
VAR  i,j,itemp,jtemp,n:integer;
begin
    n:=1;
    t[3,2]:=n;
    while (n<nMax) do
    begin
        for i := 1 to nbr do
        begin
            itemp:=i;
            for j := 1 to nbr do
            begin
                jtemp:=j;
                if (t[i,j]=n) then
                begin
                    if (itemp=nbr)or(jtemp=1) then
                    begin
                        if (jtemp=1) then
                            jtemp:=nbr;

                        if (itemp=nbr) then
                        begin
                            itemp:=1;
                            if (t[itemp,jtemp-1]=0) then
                            begin
                                t[itemp,jtemp-1]:=n+1;
                                n:=n+1;
                            end
                            else
                            begin
                                if (t[i,jtemp-1]=0)then
                                begin
                                   t[i,jtemp-1]:=n+1;
                                   n:=n+1;
                                end;
                            end;
                        end
                        else
                        begin
                            if (t[itemp+1,jtemp]=0) then
                            begin
                                t[itemp+1,jtemp]:= n+1;
                                n:=n+1;
                            end
                            else
                            begin
                                if (t[itemp,jtemp-1]=0)then
                                begin
                                   t[itemp,jtemp-1]:=n+1;
                                   n:=n+1;
                                end;
                            end;
                        end;
                    end
                    else
                    begin
                        if (t[itemp+1,jtemp-1]=0) then
                        begin
                            t[itemp+1,jtemp-1]:=n+1;
                            n:=n+1;
                        end
                        else
                        begin
                            if (jtemp=2)then
                            begin
                                jtemp:=nbr;
                                if (t[itemp,jtemp]=0)then
                                begin
                                    t[itemp,jtemp]:=n+1;
                                    n:=n+1;
                                end;
                            end
                            else
                            begin
                                if (t[itemp,jtemp-2]=0)then
                                begin
                                    t[itemp,jtemp-2]:=n+1;
                                    n:=n+1;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        {afficheCarre(t,nbr);
        gotoxy(20,20);
        writeln('OK');
        write(n);
        readln;}
    end;
    RempTbl:=t;
end;

PROCEDURE addLigne (t:tblC;nbr:integer);
//BUT:  afficher la somme des ligne 
//ENTRER: tbl et la taille du tbl
//SORTIE:
VAR i,j,k,somme_V,somme_H:integer;
begin
    j:=1;
    k:=20;
    repeat
        somme_H:=0;
        somme_V:=0;
        for i:=1 to nbr do
        begin
            somme_H:=somme_H+t[i,j];
            somme_V:=somme_V+t[j,i];
        end;
        gotoxy(20,k);
        write(somme_H,'= somme de la ligne H num :',j,' _ ',somme_V,'= somme de la ligne V num :',j);
        j:=j+1;
        k:=k+1;
    until (j>nbr); 
end;

var map:tblC;
    nbrMax:integer;
//program principal
BEGIN
    clrscr;
    nbrMax:=initnbr(tailleCareer);
    write(nbrMax);
    readln;
    clrscr;
    map:=initTbl(tailleCareer);
    afficheCarre(map,tailleCareer);
    readln;
    clrscr;
    map:=RempTbl(map,tailleCareer,nbrMax);
    afficheCarre(map,tailleCareer);
    addLigne(map,tailleCareer);
    readln;
END.
