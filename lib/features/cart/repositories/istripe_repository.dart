abstract class IStripeRepository {
  Future<bool> makePayment({required String amount, required String currency});
  Future<Map<String, dynamic>?> createPaymentIntent({
    required String amount,
    required String currency,
  });
}
