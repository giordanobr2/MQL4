#property copyright  "Copyright - $ POR PONTOS/PIPS MT4."
#property link       "mailto: giordanobr2@yahoo.com.br."
#property version    "1.0"

input string SimboloA = "XAUUSD";
input double LoteA    = 1.0; 
input string SimboloB = "XAGUSD";
input double LoteB    = 1.0; 

double Pt_A;
double Pt_B;

int OnInit() {   
   Pt_A = SymbolInfoDouble(SimboloA, SYMBOL_POINT);
   Pt_B = SymbolInfoDouble(SimboloB, SYMBOL_POINT);
   if((_Digits == 3) || (_Digits == 5)){
      Pt_A = Pt_A * 10;
      Pt_B = Pt_B * 10;
   }

   return(INIT_SUCCEEDED);
}


void OnDeinit(const int reason){
   Comment("");
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick(){
   string Comentario = "";
   string MoedaDepositada = AccountInfoString(ACCOUNT_CURRENCY);
   
   double PipValueA=(((MarketInfo(SimboloA, MODE_TICKVALUE)*Pt_A)/MarketInfo(SimboloA, MODE_TICKSIZE)) * LoteA);
   double PointValueA = PipValueA/10;
   
   double PipValueB=(((MarketInfo(SimboloB, MODE_TICKVALUE)*Pt_B)/MarketInfo(SimboloB, MODE_TICKSIZE)) * LoteB);
   double PointValueB = PipValueB/10;
   
   Print("Tick Size ativo "+SimboloA+" "+MarketInfo(SimboloA, MODE_TICKSIZE));
   Print("Tick Size ativo "+SimboloB+" "+MarketInfo(SimboloB, MODE_TICKSIZE));

   Comentario+="\n" + "Moeda depositada na conta : " + MoedaDepositada + "\n\n";   
   Comentario+="-----------------------------------------------------------------\n\n";
   Comentario+="Tamanho doo lote no "+SimboloA+" : " + DoubleToStr(LoteA,2) + "\n"; 
   Comentario+="Valor por 1 ponto (" + SimboloA + "):  $" + MoedaDepositada + " " + DoubleToStr(PointValueA,2) + "\n";
   Comentario+="Valor por 1 pip (" + SimboloA + ") : $" + MoedaDepositada + " " + DoubleToStr(PipValueA, 2) + "\n\n";
   Comentario+="-----------------------------------------------------------------\n\n";
   Comentario+="Tamanho doo lote no "+SimboloB+" : " + DoubleToStr(LoteB,2) + "\n"; 
   Comentario+="Valor por 1 ponto (" + SimboloB + "):  $" + MoedaDepositada + " " + DoubleToStr(PointValueB, 2) + "\n";
   Comentario+="Valor por 1 pip (" + SimboloB + ") : $" + MoedaDepositada + " " + DoubleToStr(PipValueB, 2) + "\n\n";
   Comentario+="-----------------------------------------------------------------\n";

   Comment(Comentario);
}
