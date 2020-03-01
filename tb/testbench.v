`timescale 			1ns/1ns
`define DATA_BW	11		//обращение к именованой константе - макросу -
								//в теле модуля осуществляется через обратный апостроф `

module testbench;

	reg clk = 0;
	reg aclr = 1;
	
	initial forever #5 clk = ~clk;			//моделирование тактового сигнала
	
	initial #100 aclr = 0;						//моделирование асинхронного сброса
	
	wire [47:0] button = 48'hffffc3a50000;	//моделирование дребезга кнопки
	
	reg in;				//сигнал данных
	reg [5:0] cnt;		//счетчик сэмплов
	
	always @(posedge clk) begin
		if (aclr) begin
			in <= 0;
			cnt <= 0;
		end
		else begin
			in <= button[cnt];		//подаем на сигнал данных следующий сэмпл
			if (cnt == 47) $stop();	//директива остановки моделирования
			else cnt <= cnt + 1;		//инкремент счетчика сэмплов
		end
	end
	
	//индикаторы
	wire led0;
	wire led1;
	wire led2;
	wire led3;
	wire led4;
	
	//объявление тестируемого модуля
	test
	#(
		.DATA_BW(`DATA_BW) 	//переопределение параметров модуля
	)
	test_inst
	(
		//входы
		.clk(clk),		
		.aclr(aclr),
		.data(in),
		
		//выходы
		.LED0(led0),
		.LED1(led1),
		.LED2(led2),
		.LED3(led3),
		.LED4(led4)
	);	

endmodule