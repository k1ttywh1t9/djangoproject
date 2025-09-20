from ninja import Router

from core.api.v1.customers.handlers import router as customer_router
from core.api.v1.products.handlers import router as product_router
from core.api.v1.reviews.handlers import router as review_router


router = Router(tags=["v1"])
product_router.add_router('', router=review_router)

router.add_router(prefix="products/", router=product_router)
router.add_router(prefix="customers/", router=customer_router)
