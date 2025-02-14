// Assignments padrao foram alterados para o funcionamento do programa
// (LEDs e os parametros da SPI)
// deletar os pinos com assignment name "current strength"

module adc_demo_mega (CLOCK_50, SW, DATA_OUT, ADC_SCLK, ADC_CONVST, ADC_SDO, ADC_SDI);

input CLOCK_50;
reg [0:0] KEY;
input [2:0] SW;
output wire [11:0] DATA_OUT;
input ADC_SDO;
output ADC_SCLK, ADC_CONVST, ADC_SDI;
wire [11:0]values[7:0];

assign DATA_OUT[11:0] = values[0][11:0];

initial
	begin
		KEY = 1'b1;
	end
//assign LED = values [SW] [11:2];


ADC_IP_adc_mega_0 ADC ( //ALTERADO PARA O NOME DO SUBMODULO DO IP
	.CLOCK (CLOCK_50),
	.RESET (!KEY[0]),
	.ADC_SCLK (ADC_SCLK),
	.ADC_CS_N (ADC_CONVST),
	.ADC_DOUT (ADC_SDO),
	.ADC_DIN (ADC_SDI),
	.CH0 (values[0]),
	.CH1 (values[1]),
	.CH2 (values[2]),
	.CH3 (values[3]),
	.CH4 (values[4]),
	.CH5 (values[5]),
	.CH6 (values[6]),
	.CH7 (values[7])
); 
endmodule