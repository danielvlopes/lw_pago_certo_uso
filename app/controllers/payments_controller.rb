class PaymentsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only=>:confirmation
  
  def new
  end
  
  def create
    lw = LwPagtoCerto.new(:chave_vendedor => "11111111111111111111111111111",
        :url_retorno => "http://localhost:3000/payments/confirmation")
    
    lw.comprador = {
      :Nome        => params[:comprador][:nome],
      :Email       => params[:comprador][:email],
      :Cpf         => params[:comprador][:cpf],
      :Rg          => params[:comprador][:rg],
      :Ddd         => params[:comprador][:dd],
      :Telefone    => params[:comprador][:telefone],
      :TipoPessoa  => params[:comprador][:tipo]
      # :RazaoSocial => "",
      # :Cnpj        => "",
    }
    lw.pagamento = {
      :Modulo => "Boleto"
      # :Tipo => "",
    }
    lw.pedido = {
      :Numero => "12345",
      :ValorSubTotal  => "000",
      :ValorFrete     => "000",
      :ValorAcrescimo => "000",
      :ValorDesconto  => "000",
      :ValorTotal     => "000",
      :Itens => {
        :Item => {
          :CodProduto    => "1234",
          :DescProduto   => "Servico",
          :Quantidade    => "1",
          :ValorUnitario => "000",
          :ValorTotal    => "000"
        },
      },
      :Cobranca => {
        :Endereco => params[:pedido][:cobranca][:endereco],
        :Numero   => params[:pedido][:cobranca][:numero],
        :Bairro   => params[:pedido][:cobranca][:bairro],
        :Cidade   => params[:pedido][:cobranca][:cidade],
        :Cep      => params[:pedido][:cobranca][:cep],
        :Estado   => params[:pedido][:cobranca][:estado]
      },
      :Entrega => {
        :Endereco => params[:pedido][:entrega][:endereco],
        :Numero   => params[:pedido][:entrega][:numero],
        :Bairro   => params[:pedido][:entrega][:bairro],
        :Cidade   => params[:pedido][:entrega][:cidade],
        :Cep      => params[:pedido][:entrega][:cep],
        :Estado   => params[:pedido][:entrega][:estado]
      },
    }    
    @retorno = lw.inicia()
  end
  
  def confirmation 
    id_transacao = params[:tdi] 
    lw = LwPagtoCerto.new(:chave_vendedor => "1111111111111111111111") 
    retorno = lw.consulta(id_transacao) 
    if retorno[:cod_retorno] == "15" 
      flash[:success] = "Pagamento bem sucedido" 
    else 
      flash[:error] = retorno[:mensagem_retorno] 
    end 
  end 

end