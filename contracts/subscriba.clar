;; Define the plans map
(define-map plans
  { plan-id: uint }
  {
    active: bool,
    duration: uint,
    price: uint,
    provider: principal
  }
)

;; Define error constants
;; Added missing error constants for already subscribed and plan not found
(define-constant ERR-PLAN-INACTIVE (err u100))
(define-constant ERR-ALREADY-SUBSCRIBED (err u101))
(define-constant ERR-PLAN-NOT-FOUND (err u102))

;; Activate subscription
(define-public (subscribe (plan-id uint))
  (match (map-get? plans {plan-id: plan-id})
    plan
    (if (not (get active plan))
        ERR-PLAN-INACTIVE
        (let (
              (expiry (+ stacks-block-height (get duration plan)))
              (amount (get price plan))
              (provider (get provider plan))
             )
          ;; Fixed map-get to map-get? on line 78
          (if (not (is-none (map-get? subscriptions {plan-id: plan-id, user: tx-sender})))
              ERR-ALREADY-SUBSCRIBED
              (begin
                (try! (stx-transfer? amount tx-sender provider))
                (map-set subscriptions {plan-id: plan-id, user: tx-sender}
                  {
                    expiry: expiry,
                    active: true
                  })
                (ok expiry)
              )
          )
        )
    )
    ERR-PLAN-NOT-FOUND
  )
)

;; Define the subscriptions map
(define-map subscriptions
  { plan-id: uint, user: principal }
  {
    expiry: uint,
    active: bool
  }
)
