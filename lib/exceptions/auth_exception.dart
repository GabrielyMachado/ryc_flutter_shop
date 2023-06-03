class AuthException implements Exception {
  final String key;

  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'E-mail já existente',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida',
    'TOO_MANY_ATTEMPTS_TRY_LATER':
        'Excedido o número máximo de tentativas, tente novamente mais tarde.',
    'EMAIL_NOT_FOUND': 'E-mail não encontrado.',
    'INVALID_PASSWORD': 'Senha inválida.',
    'USER_DISABLED': 'Usuário desabilitado.'
  };

  AuthException(this.key);

  @override
  String toString() {
    return errors[key] ?? 'Ocorreu um erro no processo de autenticação';
  }
}
