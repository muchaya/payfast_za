module Payfast
  class PaymentMethods
    ACCEPTED = {
      ef: 'EFT',
      cc: 'Credit card',
      dc: 'Debit card',
      mp: 'Masterpass Scan to Pay',
      mc: 'Mobicred',
      sc: 'SCode',
      ss: 'SnapScan',
      zp: 'Zapper',
      mt: 'MoreTyme',
      rc: 'Store card',
      mu: 'Mukuru',
      ap: 'Apple Pay',
      sp: 'Samsung Pay',
      cp: 'Capitec Pay'
    }.freeze
  end
end
