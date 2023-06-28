abstract class StatusCode {

  static const httpContinue = 100;    // RFC2518

  static const httpOk = 200;

  static const httpCreated = 201;
  static const httpAccepted = 202;

  static const httpNoContent = 204;

  static const httpNotModified = 304;

  static const httpBadRequest = 400;

  static const httpUnAuthorized = 401;
  static const httpPaymentRequired = 402;

  static const httpForbidden = 403;

  static const httpNotFound = 404;

  static const httpMethodNotAllowed = 405;

  static const httpNotAcceptable = 406;

  static const httpConflict = 409;                     // RFC6585

  static const httpInternalServerError = 500;

  static const httpNotImplemented = 501;

  static const Map httpStatusCodes = {
    httpOk: 'OK',
    httpCreated: 'CREATED',
    httpNoContent: 'NO CONTENT',
    httpNotModified: 'NOT MODIFIED',
    httpBadRequest: 'BAD REQUEST',
    httpUnAuthorized: 'UNAUTHORIZED',
    httpForbidden: 'FORBIDDEN',
    httpNotFound: 'NOT FOUND',
    httpMethodNotAllowed: 'METHOD NOT ALLOWED',
    httpNotAcceptable: 'NOT ACCEPTABLE',
    httpConflict: 'CONFLICT',
    httpInternalServerError: 'INTERNAL SERVER ERROR',
    httpNotImplemented: 'NOT IMPLEMENTED'
  };
}