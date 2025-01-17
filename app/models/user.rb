### O modelo user possui:

#nome:string
#sobrenome:string
#email:string
#password_digest:string
#situacao:string
#data_de_inicio:date

#password:string virtual
#password_confirmation:string virtual

class User < ApplicationRecord
    has_secure_password 
    # Esse metodo transforma password e password_confirmation em uma senha encriptada chamada password digest
    # Deste modo não existe forma de acesso a senha diretamente e garantimos assim a segurança das informações do usuário

    validates_presence_of :nome, :message => "não pode ser em branco!"
    validates_presence_of :sobrenome , :message => "não pode ser em branco!"
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'em formato inválido' }
    has_many :comentario
end
